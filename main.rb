require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/athletes_controller')
require_relative('controllers/events')
require_relative('controllers/nations')
require_relative('controllers/participation')

get '/' do
  erb :home
end