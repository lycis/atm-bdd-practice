class Account 
  attr_accessor :name, :account_balance

  def initialize(name, balance)
    @name = name
    @account_balance = balance
  end

  def updateBalance(adjustmentValue) 
    @account_balance = @account_balance + adjustmentValue
  end
end

class DebitCard
  attr_accessor :pin, :account

  def initialize(pin, account)
    @pin = pin
    @account = account
  end

  def verify_pin(enteredPin)
    return enteredPin == pin
  end

  def withdraw(amount)
    raise "not enough balance" unless @account.account_balance >= amount
    @account.updateBalance(-amount)
    return amount
  end
end

class ATM
  attr_accessor :cash_box, :card_inserted, :pin_entered, :current_display

  def initialize(initial_cash)
    @cash_box = initial_cash
    @card_inserted = nil
    @pin_entered = false
    @account_balance = 0
    @current_display = "Welcome to the ATM!"
  end

  def insert_card(card)
    raise "card already inserted" unless @card_inserted.nil?

    @card_inserted = card
    @current_display = "Enter PIN: "
    return true
  end

  def enter_pin(enteredPin) 
    raise "enter card first" if @card_inserted.nil?
    raise "wrong PIN" unless @card_inserted.verify_pin(enteredPin)

    @pin_entered = true
    @account_balance = @card_inserted.account.account_balance
    @current_display = "Withdraw Money: "
  end

  def withdraw(amount)
    raise "enter card first" if @card_inserted.nil?
    raise "verify pin first" unless @pin_entered

    withdrawnMoney = @card_inserted.withdraw(amount)
    self.eject_card()

    return withdrawnMoney
  end

  def eject_card()
    @card_inserted = nil
    @current_display = "Welcome to the ATM!"
  end

  def account_balance()
    raise "no card inserted" if @card_inserted.nil?
    print "account: ${@card_inserted.account}\n"
    return @card_inserted.account.account_balance
  end

end
