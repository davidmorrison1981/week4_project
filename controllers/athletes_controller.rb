require_relative('../models/athlete')
require( 'pry-byebug' )

#index
get '/athletes' do
  @athletes = Athlete.all
  erb(:'athletes/index')
end

#new
get '/athletes/new' do
  @nations = Nation.all()
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
  @nations = Nation.all()
  @athlete = Athlete.new(params)
  @athlete.save
  redirect to( "/athletes" )
end

#update
@nations = Nation.all()
post '/athletes/:id' do
end

#delete
delete '/athletes' do
end