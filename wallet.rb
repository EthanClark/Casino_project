class Wallet

  def initialize(money)
    @money = money
  end

  def wallet_menu
    puts <<-'EOF'
         _._._                       _._._
        _|   |_                     _|   |_
        | ... |_._._._._._._._._._._| ... |
        | ||| |  o NATIONAL BANK o  | ||| |
        | """ |  """    """    """  | """ |
   ())  |[-|-]| [-|-]  [-|-]  [-|-] |[-|-]|  ())
  (())) |     |---------------------|     | (()))
 (())())| """ |  """    """    """  | """ |(())())
 (()))()|[-|-]|  :::   .-"-.   :::  |[-|-]|(()))()
 ()))(()|     | |~|~|  |_|_|  |~|~| |     |()))(()
    ||  |_`____|_|_|_|__|_|_|__|_|_|_|_____|  ||
 ~ ~^^ @@@@@@@@@@@@@@/=======\@@@@@@@@@@@@@@ ^^~ ~
   ^~^~                                ~^~^
EOF
    puts "__________________________"
    puts "WALLET MENU"
    puts 'Please make a selection'
    puts "__________________________"
    puts '1) View wallet total'
    puts '2) Add money to wallet'
    puts '3) Withdrawl money'
    puts '4) MAIN MENU'
    user_choice = gets.chomp.to_i
    if user_choice == 1
      show_amount
      wallet_menu
    elsif user_choice == 2
      add_more_money
      wallet_menu
    elsif user_choice == 3
      subtract_from_amount
      wallet_menu
    elsif user_choice == 4
      menu
    end
  end

  def show_amount
    puts "__________________________"
    puts "$#{@money}"
  end

  def subtract_from_amount
    puts "Previous Total: #{@money}"
    puts 'How much would you like to withdrawl'
    withdrawl_amount = gets.strip.to_i
    @money = @money - withdrawl_amount
    puts "New Total: #{@money}"
  end

  def add_more_money
    puts "Previous Total: #{@money}"
    puts "How much would you like to deposit?"
    new_deposit = gets.strip.to_i
    @money = @money + new_deposit
    puts "New Total: #{@money}"
  end
end
