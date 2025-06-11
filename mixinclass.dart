// Mixin - reusable functionality
mixin Formatter {
  String formatCurrency(double amount) {
    return "₹${amount.toStringAsFixed(2)}";
  }
  
  String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}

mixin Validator {
  bool isValidAmount(double amount) {
    return amount > 0;
  }
  
  bool isValidCategory(String category) {
    List<String> validCategories = ["Food", "Transport", "Books", "Entertainment"];
    return validCategories.contains(category);
  }
}

// Class using multiple mixins
class Expense with Formatter, Validator {
  double amount;
  String category;
  DateTime date;
  String? description;
  
  Expense(this.amount, this.category, this.date, [this.description]);
  
  void display() {
    if (isValidAmount(amount) && isValidCategory(category)) {
      print("${formatCurrency(amount)} spent on $category");
      print("Date: ${formatDate(date)}");
      if (description != null) {
        print("Description: $description");
      }
    } else {
      print("Invalid expense data!");
    }
  }
}

class Budget with Formatter {
  double totalBudget;
  double spent;
  
  Budget(this.totalBudget, this.spent);
  
  void showStatus() {
    double remaining = totalBudget - spent;
    print("Budget: ${formatCurrency(totalBudget)}");
    print("Spent: ${formatCurrency(spent)}");
    print("Remaining: ${formatCurrency(remaining)}");
  }
}

void main() {
  var expense = Expense(150, "Food", DateTime.now(), "Lunch");
  expense.display();
  
  var budget = Budget(5000, 2000);
  budget.showStatus();
}