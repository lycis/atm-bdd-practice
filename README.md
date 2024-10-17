## ATM - BDD Practice Project

This project provides a virtual ATM implementation using Ruby to practice Behavior-Driven Development (BDD) with Cucumber. It's designed to be easily expandable for further exploration of BDD concepts.

**Getting Started**

1. **Clone the repository:**

   ```bash
   git clone https://github.com/lycis/atm-bdd-practice.git
   ```

2. **Install dependencies:**

   Ensure you have Ruby and Bundler installed. Then, navigate to the project directory and run:
Bash

```bash
bundle install
```

**Project Structure**

* **`atm.rb`:** Contains the core ATM implementation, including classes for `Account`, `DebitCard`, and `ATM` with their respective methods.
* **`atm_cli.rb`:** Provides a Command-Line Interface (CLI) for manual testing of the ATM functionality.
* **`features/withdraw.feature`:** Defines basic BDD scenarios for withdrawing cash.
* **`features/step_definitions/atm.rb`:** Implements the step definitions for the scenarios in `withdraw.feature`.

**Running the ATM CLI**

1. Navigate to the project directory:

   ```bash
   cd atm-bdd-practice
   ```

2. Run the CLI script:

   ```bash
   ruby atm_cli.rb
   ```

This will start the ATM and display a menu where you can interact with various functionalities like inserting a card, entering a PIN, checking balance, withdrawing money, and ejecting the card.

**BDD with Cucumber**

The `features` directory contains Cucumber-specific files for BDD testing. You can extend the existing scenarios and step definitions in this directory to create more comprehensive BDD tests. Consider exploring Cucumber's syntax and features for writing different types of scenarios and step definitions.

**Further Enhancements**

* **Add more ATM functionalities:** Extend the program to add features like deposit, transfer, mini-statements, etc.
* **Write more BDD scenarios:** Expand the scenarios in `withdraw.feature` and create new feature files to cover various ATM interactions.
* **Implement error handling:** Enhance the code to handle more potential errors and provide informative feedback to the user.
* **Improve UI/UX:** Refine the CLI interface for better user experience.

