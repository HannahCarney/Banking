class Account
  attr_reader :name, :balance
  def initialize(name, balance=100)
      @name = name
      @balance = balance
  end
  
  private
  def pin
     @pin = 1234
  end
  
  private
  def pin_error
      @pin_error = "Access denied: incorrect PIN."
  end
  
  public
  def display_balance(pin_number)
      if pin_number == pin
          puts "Balance: $#{@balance}."
      else puts pin_error
      end
  end
  
  public
  def withdraw(pin_number, amount)
      if pin_number != pin
        puts pin_error
      elsif amount > @balance
        puts over_draft(amount, @balance)
      elsif 
        @balance = balance - amount 
        puts "Withdrew $#{amount}. New balance: $#{@balance}."
      end

  end

  def deposit(pin_number, amount)
    if pin_number == pin
      @balance = @balance + amount
      puts "Desposited $#{amount}. New Balance: $#{@balance}"
    else puts pin_error
    end
  end

  def over_draft(amount, balance)
    @over_draft = "You cannot withdraw $#{amount} when your balance is: $#{@balance}"
  end
  
end

checking_account = Account.new("Hannah", 100_000)
checking_account.display_balance(123444)
checking_account.withdraw(12343, 100_000)
checking_account.deposit(1234, 10)
checking_account.display_balance(1234)
checking_account.withdraw(1234, 100_000_000)
