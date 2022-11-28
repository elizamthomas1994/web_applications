require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  # Declares a route that responds to a request with:
  #  - a GET method
  #  - the path /
  get '/' do

    return 'Hello!'
  end
  
  get '/hello' do
    name = params[:name]
    
    return "Hello #{name}"
  end

  post '/submit' do
    name = params[:name]
    message = params[:message]

    return "Thanks #{name}, you sent this message: '#{message}'"
  end

  get '/names' do
    name_one = params[:name_one]
    name_two = params[:name_two]
    name_three = params[:name_three]

    return "#{name_one}, #{name_two}, #{name_three}"
  end

  post '/sort-names' do
    names = params[:names]
    names.split(',').sort.join(', ')
  end  
end