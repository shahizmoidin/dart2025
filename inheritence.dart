// Parent class
class Transaction {
  double amount;
  DateTime date;
  String description;
  
  Transaction(this.amount, this.date, this.description);
  
  void display() {
    print("Transaction: ₹$amount on ${date.day}/${date.month}");
    print("Description: $description");
  }
  
  String getType() {
    return "General Transaction";
  }
}

// Child class - inherits from Transaction
class Expense extends Transaction {
  String category;
  
  Expense(double amount, DateTime date, String description, this.category)
      : super(amount, date, description);  // Call parent constructor
  
  // Override parent method
  @override
  void display() {
    super.display();  // Call parent's display
    print("Category: $category");
    print("Type: Expense");
    print("---");
  }
  
  @override
  String getType() {
    return "Expense Transaction";
  }
}

// Another child class
class Income extends Transaction {
  String source;
  
  Income(double amount, DateTime date, String description, this.source)
      : super(amount, date, description);
  
  @override
  void display() {
    super.display();
    print("Source: $source");
    print("Type: Income");
    print("---");
  }
  
  @override
  String getType() {
    return "Income Transaction";
  }
}

void main() {
  var expense = Expense(150, DateTime.now(), "Lunch", "Food");
  var income = Income(5000, DateTime.now(), "Monthly allowance", "Parents");
  
  expense.display();
  income.display();
  
  // Polymorphism - same method, different behavior
  List<Transaction> transactions = [expense, income];
  for (var transaction in transactions) {
    print("Type: ${transaction.getType()}");
  }
}