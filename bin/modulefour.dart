abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
    print("Deposited: \$${amount.toStringAsFixed(2)}");
    print("New balance: \$${balance.toStringAsFixed(2)}");
  }

  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      balance += balance * (interestRate / 100);
      print("Withdrawn: \$${amount.toStringAsFixed(2)}");
      print("New balance: \$${balance.toStringAsFixed(2)}");
    } else {
      print("Insufficient funds for withdrawal.");
    }
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance + overdraftLimit) {
      balance -= amount;
      print("Withdrawn: \$${amount.toStringAsFixed(2)}");
      print("New balance: \$${balance.toStringAsFixed(2)}");
    } else {
      print("Insufficient funds for withdrawal.");
    }
  }
}

void main() {
  SavingsAccount savings = SavingsAccount(101, 1000.0, 5.0);
  savings.deposit(500.0);
  savings.withdraw(300.0);
  print("\n");
  CurrentAccount current = CurrentAccount(201, 1500.0, 500.0);
  current.deposit(300.0);
  current.withdraw(1500.0);
}
