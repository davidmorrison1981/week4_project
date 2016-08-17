#dont think I need this?

require 'pry-byebug'
require_relative('../models/participation.rb')


#index
get '/participation' do
  @participation = Participation.all()
  erb (:'paticipation/index')
end

#create
post '/events' do
  event = Event.new(params)
  event.save()
  redirect(to('/events'))
end