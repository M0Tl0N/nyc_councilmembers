get '/' do
  erb :index
end



get '/kinds/new' do
  erb :"kinds/new"
end

post '/kinds' do
  puts params
  puts params[:kind]
  @kind = Kind.find_or_create_by(params[:kind])
  redirect "/kinds/#{@kind.id}/new"
end

get '/kinds/:kind_id/new' do
  @kind = Kind.find(params[:kind_id])
  erb :"kinds/breeds/new"
end

post '/kinds/:kind_id/breeds' do
  puts params[:breed]
  puts "IT'S HERE!!"
  @kind = Kind.find(params[:kind_id])
    puts "YOU DID IT!!"
  @breed = @kind.breeds.create(params[:breed])
  redirect "/kinds/#{@kind.id}/#{@breed.id}/new"
end

get '/kinds/:kind_id/:breed_id/new' do
  @kind = Kind.find(params[:kind_id])
  @breed = Breed.find(params[:breed_id])
  erb :"kinds/breeds/locations/new"
end

post '/kinds/:kind_id/:breed_id/locations' do
  @kind = Kind.find(params[:kind_id])
  @breed = Breed.find(params[:breed_id])
  @location = Location.find_or_create_by(params[:location])
  redirect "/kinds/#{@kind.id}/#{@breed.id}/#{@location.id}/new"
end

get '/kinds/:kind_id/:breed_id/:location_id/new' do
  puts @kind = Kind.find(params[:kind_id])
  @breed = Breed.find(params[:breed_id])
  @location = Location.find(params[:location_id])
  erb :"kinds/breeds/locations/animals/new"
end

post '/kinds/:kind_id/:breed_id/:location_id/animals' do
  @kind = Kind.find(params[:kind_id])
  @breed = Breed.find(params[:breed_id])
  @location = Location.find(params[:location_id])
  @animal = @breed.animals.find_or_create_by(params[:animal])
  redirect "/kinds/#{@kind.id}/#{@breed.id}/#{@location.id}/#{@animal.id}/index"
end

get '/kinds/:kind_id/:breed_id/:location_id/:animal_id/index' do
  erb :"kinds/breeds/locations/animals/index"
end




