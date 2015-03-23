get '/' do
  erb :login
end

post '/' do
  @user = User.find_by(email: params[:email])
  if User.authentication(params[:email], params[:password])
      session[:user_id] = @user.id
      redirect '/home'
  else
    @errors = @user.errors.messages
    erb :login
  end
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  @user = User.create(params[:user])
  session[:user_id] = @user.id
  redirect '/home'
end

get '/home' do
  @user = User.find(session[:user_id])
  erb :home
end

get '/category/:category_id' do
  @category = Category.find(params[:category_id])
  erb :category
end

get '/category/:category_id/product/:product_id' do
  @category = Category.find(params[:category_id])
  @product = Product.find(params[:product_id])
  erb :product
end

get '/category/:category_id/product/:product_id/cart' do
  @user = User.find(session[:user_id])
  @order = Order.find_by(user_id: session[:user_id])
  p @product = Product.find(params[:product_id])
  if @order.nil?
    @order = Order.create(user_id: session[:user_id])
    @product.update_attributes(order_id: @order.id)
  else
    @product.update_attributes(order_id: @order.id)
  end
  @all_products = Product.where(order_id: @order.id)
  @total_price = @all_products.map { |product| product.price }.inject(:+)
  erb :cart
end

get '/logoff' do
  session[:user_id] = nil
  redirect "/"
end
