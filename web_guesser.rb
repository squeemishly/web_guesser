require 'sinatra'
require 'sinatra/reloader'

class WebGuesser
  attr_reader :number

  def initialize
    @number = rand(100)
  end

  def color_setter(answer)
    if answer.nil?
      "white"
    elsif answer.to_i == number
      "green"
    elsif too_high(answer)
      if way_too_high(answer)
        "red"
      else
        "lightcoral"
      end
    elsif too_low(answer)
      if way_too_low(answer)
        "red"
      else
        "lightcoral"
      end
    end
  end

  def messager(answer)
    if answer.nil?
      message = "Guess the secret number in the field below."
    elsif answer.to_i == number
      message = "You guessed #{number} correctly! Now guess the new number."
    elsif too_high(answer)
      if way_too_high(answer)
        message = "You're waaay too high!"
      else
        message = "You guessed too high! Try again!"
      end
    elsif too_low(answer)
      if way_too_low(answer)
        message = "You're waaay too low!"
      else
        message = "You guessed too low! Try again!"
      end
    end
  end

  def too_high(answer)
    answer.to_i > number
  end

  def way_too_high(answer)
    answer.to_i > (number + 5)
  end

  def too_low(answer)
    answer.to_i < number
  end

  def way_too_low(answer)
    answer.to_i < (number - 5)
  end

end

guesser = WebGuesser.new

get '/' do
  answer = params['guess']
  erb :index, :locals => {:colors => guesser.color_setter(answer), :message => guesser.messager(answer)}
end
