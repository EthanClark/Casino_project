class Wallet
attr_accessor :money
  def initialize(@money)
    money = 100
    @money = money
  end

  def money_total
     puts "Here is how much money you have now: $#{@money}"
  end

end
