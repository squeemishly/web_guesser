require 'sinatra'
require 'sinatra/reloader'

class WebGuesser
  attr_reader :number

  def initialize
    @number = rand(100)
  end

  def messager(answer)
    if answer.nil?
      message = "Guess the secret number in the form below."
    elsif answer.to_i > number
      message = "You guessed too high! Try again!"
    elsif answer.to_i < number
      message = "You guessed too low! Try again!"
    elsif answer.to_i == number
      @number = rand(100)
      message = "You guessed correctly! Now guess the new number."
    end
  end

end

guesser = WebGuesser.new

get '/' do
  answer = params['guess']
  erb :index, :locals => {:message => guesser.messager(answer)}
end
