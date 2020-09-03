

require 'colorize'

class Slots
  def initialize(money)
    @pending_bet = 0
    @money = money
  end

#user_name should be connected with the Casino menu
# def welcome
#   puts "_________________________________________________"
#   puts <<-'EOF'
#      _       _                        _     _
#     | |     | |                      | |   (_)
#  ___| | ___ | |_ _ __ ___   __ _  ___| |__  _ _ __   ___
# / __| |/ _ \| __| '_ ` _ \ / _` |/ __| '_ \| | '_ \ / _ \
# \__ \ | (_) | |_| | | | | | (_| | (__| | | | | | | |  __/
# |___/_|\___/ \__|_| |_| |_|\__,_|\___|_| |_|_|_| |_|\___|
# EOF
#   puts "_________________________________________________"
#   puts 'WELCOME TO SLOTS!'
#   puts "Please type your name and lets win big!"
#   puts "_________________________________________________"
#   @user_name = gets.chomp
#   slot_menu
# end
def slot_menu
  puts <<-'EOF'
     _       _                        _     _
    | |     | |                      | |   (_)
 ___| | ___ | |_ _ __ ___   __ _  ___| |__  _ _ __   ___
/ __| |/ _ \| __| '_ ` _ \ / _` |/ __| '_ \| | '_ \ / _ \
\__ \ | (_) | |_| | | | | | (_| | (__| | | | | | | |  __/
|___/_|\___/ \__|_| |_| |_|\__,_|\___|_| |_|_|_| |_|\___|
EOF
  puts "_________________________________________________"
  puts "Here is your current chip total: $#{@money}"
  puts "1) Pull slot lever #{@user_name}!"
  puts '2) Rules / Conditions'
  puts '3) Play a different game'
  puts "_________________________________________________"
  user_choice = gets.strip.to_i
  if user_choice == 1
    pid = fork{ exec 'afplay', "slot_sound.mp3" }
    pull_lever
    slot_menu
  elsif user_choice == 2
    rules
  elsif user_choice == 3
    menu
  else
    puts 'enter valid selection'
    slot_menu
  end
end

def pull_lever
  @f = []
 @slot1 = ["apple".colorize(:red), "taco".colorize(:green), "spade".colorize(:blue)]
@f.append (@slot1.sample)
 @slot2 = ["apple".colorize(:red), "taco".colorize(:green), "spade".colorize(:blue)]
@f.append (@slot2.sample)
 @slot3 = ["apple".colorize(:red), "taco".colorize(:green), "spade".colorize(:blue)]
@f.append (@slot3.sample)
  puts @f
  value = 0
  if
    @f === ["apple".colorize(:red), "apple".colorize(:red), "apple".colorize(:red)]
    value = 35
    puts "You won $#{value}!"
    @money = @money + 35
  elsif
    @f === ["spade".colorize(:blue), "spade".colorize(:blue), "spade".colorize(:blue)]
    value = 30
    puts "You won $#{value}!"
    @money = @money + 30
  elsif
    @f === ["taco".colorize(:green), "taco".colorize(:green), "taco".colorize(:green)]
    value = 40
    puts "You won $#{value}!"
    @money = @money + 40
  else
    value = 0
    puts "You lose!"
    @money = @money - 2.5
  end
  @f.clear
  end

  def rules
  puts 'For every spin you pay $2.50'
  puts 'apple, apple, apple = $35'
  puts 'spade, spade, spade = $30'
  puts 'taco, taco, taco = $40'
  puts 'Otherwise you lose'
  end
end