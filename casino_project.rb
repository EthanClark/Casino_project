#Start game player has a name and an initial bankroll
#Player can go to different games via menu
  #Slots
  #High / Low
#Player places bet and wins / loses (hint: rand)
#Player's bankroll goes up and down with wins and losses

@money = 100
require_relative 'card'
require_relative 'deck'
require_relative 'dice'
require_relative 'hilo'
def welcome
  puts 'Welcome to the best Casino ever!'
  puts 'What is your name?'
  @user_name = gets.chomp
end
def menu
  puts 'What would you like to do:'
  puts '1) See your wallet total'
  puts '2) Play Slots'
  puts '3) Play Heads & Tails'
  puts '4) Cashout and Checkout' #Exit
  user_choice = gets.strip.to_i
  if user_choice === 1
    puts "Here is how much money you have now:"
    money_total
    menu
  elsif user_choice === 2
    play_slots
    menu
  elsif user_choice === 3
    hilo = Hilo.new(@money)
    hilo.play_hilo
    menu
  elsif user_choice === 4
    puts 'Better luck next time.'
    exit
  else 
    puts 'Please choose a valid menu option'
    menu
  end
end
welcome
menu 