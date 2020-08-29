# rolls 2 dice
# winning numbers 2, 4, 6, 8, 12
# losing numbers 3, 5, 7, 9, 11
# can do a double or nothing
require 'pry'

# $bet_total = []
#
# $bets = []

@money = 100
@bet_amount = 0
pid = fork{ exec 'afplay', "poker_face.mp3" }

class Dub_r_not
  # def initialize(money)
  #   @bet_amount = 0
  #   @money = money
  # end
end

def double_or_nothing
  puts "_________________________________________________"
  puts "Welcome to Double or Nothing"
  puts "For each win you recieve +50% on your bet amount"
  puts "Option to double each win, but can lose it all"
  puts "_________________________________________________"
  puts "Here's your current balance:"
  puts "$#{@money}"
  puts "_________________________________________________"
  puts "Bet amount"
  puts "1) $10"
  puts "2) $20"
  puts "3) $30"
  puts "4) Game Rules"
  puts "5) BACK TO MENU"
  puts "_________________________________________________"
  user_choice = gets.strip.to_i
  if user_choice == 1
    @bet_amount = @bet_amount + 10
    @money = @money - 10
    puts 'Bet placed for $10'
    roll_bet
    double_or_nothing
  elsif user_choice == 2
    @bet_amount = @bet_amount + 20
    @money = @money - 20
    puts 'Bet placed for $20'
    roll_bet
    double_or_nothing
  elsif user_choice == 3
    @bet_amount = @bet_amount + 30
    @money = @money - 30
    puts 'Bet placed for $30'
    roll_bet
    double_or_nothing
  elsif user_choice == 4
    puts 'RULES'
    puts 'Roll evens you win!'
    puts 'Roll odds you lose!'
    puts 'Chance to double it all'
    double_or_nothing
  elsif user_choice == 5
    exit
    # menu
  else
    puts "Please choose a valid option!"
    double_or_nothing
  end
end

def roll_bet
  puts "Roll Dice"
  puts "-----------"
  puts "Press 0 to roll dice"
  user_choice = gets.strip.to_i
  if user_choice === 0
    # $bets << {bet: 'Evens'}
    dice_roll
    dice_wl
    win_doubled
    double_or_nothing
  else
    puts 'Please choose a valid menu option'
    roll_bet
  end
end
def dice_roll
  d1 = rand(1..6)
  d2 = rand(1..6)
  @dtotal = d1 + d2
  puts "dice 1 : #{d1}"
  puts "dice 2 : #{d2}"
  puts "total = #{@dtotal}"
end

def dice_wl
  if @dtotal.even? == true
    puts "Winner!"
    @winnings = @bet_amount * 1.50
    # @money = @money + @winnings
  else
    puts "Loser!"
    @bet_amount = @bet_amount * 0
  end
end

def win_doubled
  if @dtotal.even? == true
    puts 'Try to double the stack?'
    puts '1) Double it!'
    puts "2) No I'm too scared!"
    user_choice = gets.strip.to_i
    if user_choice == 1
      dice_roll
      if @dtotal.even? == true
        puts 'BIG WINNER!'
        @winnings = @bet_amount * 2
        @money = @money + @winnings
        @bet_amount = @bet_amount * 0
      else
        puts 'You lost it all!'
        @bet_amount = @bet_amount * 0
      end
    elsif user_choice == 2
      @money = @money + @winnings
      @bet_amount = @bet_amount * 0
    double_or_nothing
    end
  end
end

double_or_nothing
roll_bet
# Dub_r_not.new.roll_bet
# Dub_r_not.new.dice_roll
