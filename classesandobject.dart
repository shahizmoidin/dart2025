class Expense {
  // Properties (variables inside class)
  double amount;
  String category;
  DateTime date;
  String? description;
  
  // Constructor - how to create an expense
  Expense(this.amount, this.category, this.date, [this.description]);
  
  // Method (function inside class)
  void displayExpense() {
    print("Expense: ₹$amount for $category on ${date.day}/${date.month}");
    if (description != null) {
      print("Description: $description");
    }
  }
  
  // Method with return value
  String getFormattedAmount() {
    return "₹${amount.toStringAsFixed(2)}";
  }
}

void main() {
  // Creating objects from class
  var lunch = Expense(150, "Food", DateTime.now(), "Lunch at canteen");
  var busTicket = Expense(25, "Transport", DateTime.now());
  
  lunch.displayExpense();
  busTicket.displayExpense();
  
  print("Lunch cost: ${lunch.getFormattedAmount()}");
}