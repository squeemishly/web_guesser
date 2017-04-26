require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

def messager(answer)
  if answer.nil?
    message = "Guess the secret NUMBER in the form below. The secret NUMBER is #{NUMBER}"
  elsif answer.to_i > NUMBER
    message = "You guessed too high! Try again! The secret NUMBER is #{NUMBER}"
  elsif answer.to_i < NUMBER
    message = "You guessed too low! Try again! The secret NUMBER is #{NUMBER}"
  elsif answer.to_i == NUMBER
    message = "You guessed correctly! Congratulations!"
  end
end

get '/' do
  answer = params['guess']
  erb :index, :locals => {:message => messager(answer)}
end
