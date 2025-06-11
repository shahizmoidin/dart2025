// Named parameters
void addExpense({required double amount, required String category, String? description}) {
  print("Added: ${formatCurrency(amount)} for $category");
  if (description != null) {
    print("Description: $description");
  }
}

// Optional positional parameters
String createExpenseReport(String category, [String? month, int? year]) {
  month ??= "Current";
  year ??= DateTime.now().year;
  return "Report for $category in $month $year";
}

// Default parameter values
double calculateBudgetRemaining(double budget, double spent, {double buffer = 0}) {
  return budget - spent - buffer;
}

String formatCurrency(double amount) => "₹${amount.toStringAsFixed(2)}";

void main() {
  // Using named parameters
  addExpense(amount: 150, category: "Food", description: "Lunch");
  addExpense(amount: 50, category: "Transport");
  
  // Using optional parameters
  print(createExpenseReport("Food"));
  print(createExpenseReport("Transport", "January", 2025));
  
  // Using default parameters
  print("Remaining: ${formatCurrency(calculateBudgetRemaining(1000, 750))}");
  print("With buffer: ${formatCurrency(calculateBudgetRemaining(1000, 750, buffer: 100))}");
}