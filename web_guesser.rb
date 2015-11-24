require 'sinatra'
require 'sinatra/reloader'
require 'pry'

set :number, rand(100)

def check_guess(guess)
  if guess == ""
    "C'mon, guess a number!"
  else
    guess = guess.to_i
    if guess > settings.number && (guess - 5) > settings.number
      "Way too high!"
    elsif guess > settings.number
      "Too high!"
    elsif guess < settings.number && (guess + 5) < settings.number
      "Way too low!"
    elsif guess < settings.number
       "Too low!"
    elsif guess == settings.number
      "You got it right!"
     end
   end
end

def color_response(string)
  if string == "Way too high!" || string == "Way too low!" || string == "C'mon, guess a number!"
    color = "red"
  elsif string == "Too high!" || string == "Too low!"
    color = "rgb(255, 153, 153)"
  else
    color = "rgb(0, 255, 0)"
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  color = color_response(message)
  victory = "The Secret Number is #{settings.number}" if message == "You got it right!"

  erb :index, :locals => { :message => message, :color => color, :victory => victory}
end
