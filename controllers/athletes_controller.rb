require_relative('../models/athlete')

#index
get '/athletes' do
  @athletes = Athlete.all
  erb(:'athletes/index')
end

#new
get '/athletes/new' do
  erb(:'athletes/new')
end

#show
get '/athletes/:id' do
  @athlete = Athlete.find(params['id'])
  erb(:'athletes/show')
end

#edit
get '/athletes/:id/edit' do
end

#create
post '/athletes' do
  @athlete = Athlete.new(params)
  @athlete.save
  redirect to( "/athletes" )
end

#update
post '/athletes/:id' do
end

#delete
delete '/athletes' do
end