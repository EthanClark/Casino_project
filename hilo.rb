Bet_selection = []
Success = []

class Hilo
  def initialize(money)
    @pending_bet = 0
    @money = money
  end
  def play_hilo
    puts <<-'EOF'
         _.-'~~`~~'-._
      .'`  B   E   R  `'.
     / I               T \
   /`       .-'~"-.       `\
  ; L      / `-    \      Y ;
 ;        />  `.  -.|        ;
 |       /_     '-.__)       |
 |        |-  _.' \ |        |
 ;        `~~;     \\        ;
  ;  INGODWE /      \\)P    ;
   \  TRUST '.___.-'`"     /
   `\                    /`
     '._   1 9 9 6   _.'
        `'-..,,,..-'`
EOF
    puts "-----------"
    puts 'Welcome to Heads & Tails'
    puts "For every win you will receive a 25% return on your bet"
    puts "-----------"
    puts "Here's your current balance:"
    puts "$#{@money}"
    puts "-----------"
    puts "How much would you like to bet"
    puts "1) $1"
    puts "2) $5"
    puts "3) $10"
    puts "4) MAIN MENU"
    puts "-----------"
    user_choice = gets.strip.to_i
    if user_choice == 1
      @pending_bet = @pending_bet + 1
      @money = @money - 1
      heads_tails
    elsif user_choice == 2
      @pending_bet = @pending_bet + 5
      @money = @money - 5
      heads_tails
    elsif user_choice == 3
      @pending_bet = @pending_bet + 10
      @money = @money - 10
      heads_tails
    elsif user_choice == 4
      menu
    else
      puts 'Please choose a valid menu option'
      play_hilo
    end
  end
  def heads_tails
    puts "Heads or Tails?"
    puts "-----------"
    puts "1) Heads"
    puts "2) Tails"
    user_choice = gets.strip.to_i
    if user_choice === 1
      Bet_selection << {success: 'Heads'}
      coin_flip
      hilo_wnl
      play_hilo
    elsif user_choice === 2
      Bet_selection << {success: 'Tails'}
      coin_flip
      hilo_wnl
      play_hilo
    else
      puts 'Please choose a valid menu option'
      heads_tails
    end
  end
  def coin_flip
    flip = rand(1..2)
    if flip == 1
      Success << {success: 'Heads'}
      puts "-----------"
      puts "It's Heads!"
    else
      puts "-----------"
      puts "It's Tails!"
      Success << {success: 'Tails'}
    end
  end
  def hilo_wnl
    # we need rand result, if Heads/tails bet, how much was bet
    if Success === Bet_selection
      puts "Winner, Winner, Chicken Diner!"
      puts "-----------"
      winnings = @pending_bet * 1.25
      @money= @money + winnings
    else
      puts "You Lose. May the odds be ever in your favor."
      puts "-----------"
    end
    Success.clear
    Bet_selection.clear
    @pending_bet = @pending_bet * 0
  end
end
