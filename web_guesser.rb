require 'sinatra'
require 'sinatra/reloader'
#
# SECRET_NUMBER = rand(100)
#
# SECRET_NUMBER = rand(100)

set :number, rand(100)

def check_guess(guess)
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
    "You got it right! \n\n the Secret Number is #{settings.number}"
   end

end
get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => { :message => message}
end
