class Expense {
  double _amount;  // Private variable (starts with _)
  String category;
  DateTime date;
  String? description;
  
  Expense(this._amount, this.category, this.date, [this.description]);
  
  // Getter - access private variable
  double get amount => _amount;
  
  // Setter - control how value is set
  set amount(double value) {
    if (value > 0) {
      _amount = value;
    } else {
      print("Amount must be positive!");
    }
  }
  
  // Computed property (calculated getter)
  String get formattedAmount => "₹${_amount.toStringAsFixed(2)}";
  
  // Check if it's a recent expense
  bool get isRecent {
    var now = DateTime.now();
    var difference = now.difference(date).inDays;
    return difference <= 7;  // Within last 7 days
  }
  
  void display() {
    String recentText = isRecent ? " (Recent)" : "";
    print("$category: $formattedAmount$recentText");
  }
}

void main() {
  var expense = Expense(150, "Food", DateTime.now().subtract(Duration(days: 3)));
  
  print("Original amount: ${expense.formattedAmount}");
  
  expense.amount = 200;  // Using setter
  print("Updated amount: ${expense.formattedAmount}");
  
  expense.amount = -50;  // This will show error message
  
  expense.display();  // Shows if recent or not
}