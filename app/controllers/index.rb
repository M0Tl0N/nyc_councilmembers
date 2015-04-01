get "/" do
  redirect "restaurants"
end

get "/restaurants" do
  @restaurants = Restaurant.all
  erb :"restaurants/index"
end

get "/restaurants/new" do
  erb :"restaurants/new"
end

post "/restaurants" do
  Restaurant.create(params[:restaurant])
  redirect "/restaurants"
end

get "/restaurants/:restaurant_id" do
  @restaurant = Restaurant.find(params[:restaurant_id])
  erb :"restaurants/show"
end

get "/restaurants/:restaurant_id/edit" do
  @restaurant = Restaurant.find(params[:restaurant_id])
  erb :"restaurants/edit"
end

put "/restaurants/:restaurant_id" do
  restaurant = Restaurant.find(params[:restaurant_id])
  restaurant.update(params[:restaurant])
  redirect "/restaurants/#{restaurant.id}"
end

delete "/restaurants/:restaurant_id" do
  restaurant = Restaurant.find(params[:restaurant_id])
  restaurant.destroy
  redirect "/restaurants"
end

get '/restaurants/:restaurant_id/reviews/new' do
  @restaurant = Restaurant.find(params[:restaurant_id])
  erb :"reviews/new"
end

post "/restaurants/:restaurant_id/reviews" do
  @restaurant = Restaurant.find(params[:restaurant_id])
  @restaurant.reviews.create(rating: params[:rating],
                         comment: params[:comment])
  redirect "/restaurants/#{@restaurant.id}"
end

get "/reviews/:review_id" do
  @review = Review.find(params[:review_id])
  erb :"reviews/show"
end

get "/reviews/:review_id/edit" do
  @review = Review.find(params[:review_id])
  erb :"reviews/edit"
end

put "/reviews/:review_id" do
  review = Review.find(params[:review_id])
  review.update_attributes(rating: params[:rating], comment: params[:comment])
  redirect "/reviews/#{review.id}"
end

delete "/reviews/:review_id" do
  review = Review.find(params[:review_id])
  review.destroy
  redirect "/restaurants/#{review.restaurant_id}"
end
