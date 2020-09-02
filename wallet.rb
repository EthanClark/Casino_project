
class Wallet

  attr_accessor :amount
  
  def initialize(amount)
    @amount = amount
  end

  def show_amount
    puts "$#{@amount}.00"
  end

  def subtract_from_amount(money_lost)
    puts "Previous Total: #{@amount}"
    # puts money_lost
    @amount = @amount - money_lost
    puts "New Total: #{@amount}"
  end
  
  def add_more_money
    puts "Previous Total: #{@amount}"
    puts "How much would you like to deposit?"
    new_deposit = gets.strip.to_i
    @amount = @amount + new_deposit
    puts "New Total: #{@amount}"
  end
end