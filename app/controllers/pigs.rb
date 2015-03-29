get '/pigs' do
  @pigs = current_farmer.pigs

erb :"pigs/show"
end

post '/pigs' do
    current_farmer.pigs.create(params[:pig])
    redirect '/pigs'
end

get '/pigs/new' do

erb :"pigs/new"
end

get '/pigs/:id' do
  @pig = Pig.find_by(id: params[:id])

  erb :"pigs/display"
end

delete '/pigs/:pig_id' do
  @pig = Pig.find_by(id: params[:pig_id])
  @pig.destroy

  redirect '/pigs'
end

put '/pigs/:pig_id' do
  @pig = Pig.find_by(id: params[:pig_id])
  @pig.update_attributes(params[:pig])
  redirect '/pigs'
end

get '/pigs/:pig_id/edit' do
  @pig = Pig.find_by(id: params[:pig_id])

  erb :"pigs/edit"
end


