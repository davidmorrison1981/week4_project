#dont think I need this?

require 'pry-byebug'
require_relative('../models/participation.rb')


#index
get '/participation' do
  @participation = Participation.all()
  erb (:'paticipation/index')
end

#create
post '/rentals' do
  rental = Rental.new(params)
  rental.save()
  redirect(to('rentals'))
end