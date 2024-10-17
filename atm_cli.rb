require_relative 'atm'  # Include the ATM classes from atmclone.rb

def display_menu
  puts "\nATM Menu:"
  puts "1. Insert Card"
  puts "2. Enter PIN"
  puts "3. Check Balance"
  puts "4. Withdraw Money"
  puts "5. Eject Card"
  puts "6. Exit"
end

def main
  # Create an account and debit card for testing
  account = Account.new("John Doe", 1000)
  debit_card = DebitCard.new("1234", account)

  # Initialize the ATM with some cash
  atm = ATM.new(500)

  loop do
    display_menu
    print atm.current_display + "\n"
    print "Choose an option (1-6): "
    choice = gets.chomp.to_i

    case choice
    when 1
      begin
        atm.insert_card(debit_card)
        puts "Card inserted successfully."
      rescue => e
        puts e.message
      end
    when 2
      print "Enter your PIN: "
      entered_pin = gets.chomp
      begin
        atm.enter_pin(entered_pin)
        puts "PIN accepted."
      rescue => e
        puts e.message
      end
    when 3
      begin
        puts "Your account balance is $#{atm.account_balance}."
      rescue => e 
        puts "Error: #{e.message}"
      end
    when 4
      print "Enter amount to withdraw: "
      amount = gets.chomp.to_f
      begin
        withdrawn_amount = atm.withdraw(amount)
        puts "You have withdrawn $#{withdrawn_amount}."
        puts "Remaining cash in ATM: $#{atm.cash_box}."
      rescue => e
        puts e.message
      end
    when 5
      begin
        atm.card_inserted = nil
        atm.pin_entered = false
        puts "Card ejected successfully."
      rescue => e
        puts e.message
      end
    when 6
      puts "Exiting the ATM. Thank you!"
      break
    else
      puts "Invalid option. Please choose a number between 1 and 6."
    end
  end
end

# Run the main method to start the ATM CLI
main

