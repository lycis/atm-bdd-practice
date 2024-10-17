Feature: Cash Withdrawl from ATM with a debit card
  As a bank account owner
  I want to withdraw cash from the ATM
  So that I have money available when I need it

  Scenario: Account with sufficient funds
    Given there is an account with a balance of 200
    And the debit card was inserted
    And the correct PIN was entered
    And the cash box contains 1000
    When I withdraw 150
    Then the account balance should be 50
    And I receive 150 from the ATM
    And the card is returned

  Scenario: Wrong PIN entered
    Given there is an account with a balance of 200
    And the debit card was inserted
    When I enter a wrong PIN
    Then the ATM tells me that the PIN is wrong
