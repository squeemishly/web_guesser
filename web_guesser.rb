require 'sinatra'
require 'sinatra/reloader'

x = rand(100)

get '/' do
  "The secrect number is #{x}"
end
