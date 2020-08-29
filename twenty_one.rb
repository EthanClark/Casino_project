# 21 card game
# player vs house
# 2 cards to each at start
# house 1 up, 1 down
# player 2 up, can say hit me
@money = 100

@bet_amount = 0

class Twenty_one

end

def two_one
  puts '--------------------------------'
  puts 'Welcome to 21'
  puts 'How lucky are you?'
  puts '--------------------------------'
  puts "Chip total : $#{@money}"
  puts '--------------------------------'
  puts 'Bet amount:'
  puts '1) $10'
  puts '2) $20'
  puts '3) $30'
  puts '4) BACK TO MENU'
  puts '--------------------------------'
  user_choice = gets.chomp.to_i
  if user_choice == 1
    @bet_amount = @bet_amount + 10
    @money = @money - 10
    two_one
  elsif user_choice == 2
    @bet_amount = @bet_amount + 20
    @money = @money - 20
    two_one
  elsif user_choice == 3
    @bet_amount = @bet_amount + 30
    @money = @money - 30
    two_one
  elsif user_choice == 4
    exit
    #menu
  else
    puts 'Please Enter A Valid Option'
    two_one
  end
end

def player

end

def house

end

two_one
