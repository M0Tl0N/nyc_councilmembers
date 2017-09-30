
get '/' do 

    @councilmembers = CouncilMember.all

    erb :index
end 

