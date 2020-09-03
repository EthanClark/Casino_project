#Start game player has a name and an initial bankroll
#Player can go to different games via menu
  #Slots
  #High / Low
#Player places bet and wins / loses (hint: rand)
#Player's bankroll goes up and down with wins and losses


require_relative 'card'
require_relative 'deck'
require_relative 'dice'
require_relative 'wallet'
require_relative 'hilo'
require_relative 'dice_casino'
require_relative 'slot'

def welcome
  puts "__________________________________________________"
  puts <<-'EOF'
                                II
                                ""
 ,adPPYba, ,adPPYYba, ,adPPYba, 88 8b,dPPYba,   ,adPPYba,
a8"     "" ""     `Y8 I8[    "" 88 88P'   `"8a a8"     "8a
8b         ,adPPPPP88  `"Y8ba,  88 88       88 8b       d8
"8a,   ,aa 88,    ,88 aa    ]8I 88 88       88 "8a,   ,a8"
 `"Ybbd8"' `"8bbdP"Y8 `"YbbdP"' 88 88       88  `"YbbdP"'
EOF
  puts "__________________________________________________"
  puts 'Welcome to the best Casino ever!'
  puts 'What is your name?'
  @user_name = gets.chomp.capitalize
  puts 'How much money would you like to deposit?'
  @money = gets.chomp.to_f
end
def menu
  puts "____________________________"
  puts 'MAIN MENU'
  puts "What would you like to do #{@user_name}:"
  puts "____________________________"
  puts '1) Personal wallet'
  puts '2) Play Slots'
  puts '3) Play Heads & Tails'
  puts '4) Play Double or Nothing'
  puts '5) Cashout and Checkout'
  puts "____________________________"
  user_choice = gets.strip.to_i
  if user_choice == 1
    wallet = Wallet.new(@money)
    wallet.wallet_menu
    menu
  elsif user_choice == 2
    play_slots = Slots.new(@money)
    play_slots.slot_menu
    menu
  elsif user_choice == 3
    hilo = Hilo.new(@money)
    hilo.play_hilo
    menu
  elsif user_choice == 4
    dice_casino = Dub_r_not.new(@money)
    dice_casino.double_or_nothing
    menu
  elsif user_choice == 5
    puts 'Come back soon'
    exit
  else
    puts 'Please choose a valid menu option'
    menu
  end
end
welcome
menu
