require_relative('../models/event')
require( 'pry-byebug' )

#index
get '/events' do
  @events = Event.all
  erb(:'events/index')
end

#new
get '/events/new' do
  @athletes = Athlete.all
  erb(:'events/new')
end

#show
get '/events/:id' do
  @event = Event.find(params['id'])
  erb(:'events/show')
end

#edit
get '/events/:id/edit' do
end

#create
post '/events' do
  @event = Event.new(params)
  @event.save
  redirect to( "/events" )
end

#update
post '/events/:id' do
end

#delete
delete '/events' do
end