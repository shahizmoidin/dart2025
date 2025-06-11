// Simple function
void printWelcome() {
  print("Welcome to Expense Tracker!");
}

// Function with parameters
double calculateTotal(List<double> expenses) {
  double total = 0;
  for (double expense in expenses) {
    total += expense;
  }
  return total;
}

// Function with return type
String formatCurrency(double amount) {
  return "₹${amount.toStringAsFixed(2)}";
}

void main() {
  printWelcome();
  
  List<double> myExpenses = [100, 250, 75];
  double total = calculateTotal(myExpenses);
  print("Total: ${formatCurrency(total)}");
}