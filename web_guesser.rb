require 'sinatra'
require 'sinatra/reloader'

class WebGuesser
  attr_reader :number

  def initialize
    @number = rand(100)
  end

  def messager(answer)
    if answer.nil?
      message = "Guess the secret number in the form below. (it is #{number})"
    elsif answer.to_i == number
      @number = rand(100)
      message = "You guessed correctly! Now guess the new number. (it is #{number})"
    elsif answer.to_i > number
      if answer.to_i > (number + 5)
        message = "You're waaay too high!"
      else
        message = "You guessed too high! Try again! (it is #{number})"
      end
    elsif answer.to_i < number
      if answer.to_i < (number - 5)
        message = "You're waaay too low!"
      else
        message = "You guessed too low! Try again! (it is #{number})"
      end
    end
  end

end

guesser = WebGuesser.new

get '/' do
  answer = params['guess']
  erb :index, :locals => {:message => guesser.messager(answer)}
end
