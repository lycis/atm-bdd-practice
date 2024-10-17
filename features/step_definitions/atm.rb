require_relative('../../atm')

CORRECT_PIN = "1234"

account = Account.new('John Doe', 1000)
debit_card = DebitCard.new(CORRECT_PIN, account)
atm = ATM.new(1000)
withdrawn = 0
lastError = ""

Given('there is an account with a balance of {int}') do |int|
  account.account_balance = int
end

Given('the debit card was inserted') do
  atm.insert_card(debit_card) 
end

Given('the correct PIN was entered') do
  atm.enter_pin(CORRECT_PIN)
end

Given('the cash box contains {int}') do |int|
  atm.cash_box = int
end

When('I withdraw {int}') do |int|
  withdrawn = atm.withdraw(int)
end

Then('the account balance should be {int}') do |int|
  balance = account.account_balance()
  raise "balance is #{balance} insted of #{int}" unless balance == int
end

Then('I receive {int} from the ATM') do |int|
  raise "incorrect sum dispensed (#{withdrawn} instead of expected #{int})" unless withdrawn == int
end

Then('the card is returned') do
  raise "there is still card in the ATM" unless atm.card_inserted.nil?
end

When('I enter a wrong PIN') do
  begin
    atm.enter_pin("wrong pin")
  rescue => e  
    lastError = e.message
  end
end

Then('the ATM tells me that the PIN is wrong') do
  raise "ATM gave no error message" if lastError.empty?
end
