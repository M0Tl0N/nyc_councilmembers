get '/login' do

erb :index
end

post '/login' do
    farmer = Farmer.authenticate(params[:farmer])

    if farmer
        session[:farmer_id] = farmer.id
        redirect '/pigs'
    else
        @error = "You did something wrong..."
        erb :index
    end
end
