// Arrow function - short way for simple functions
double add(double a, double b) => a + b;
bool isOverBudget(double expense, double budget) => expense > budget;
String getExpenseIcon(String category) => category == "Food" ? "🍔" : "💰";

// Regular vs Arrow function
double calculateTax(double amount) {
  return amount * 0.18;  // Regular function
}

double calculateTaxArrow(double amount) => amount * 0.18;  // Arrow function

void main() {
  print("Sum: ${add(100, 200)}");
  print("Over budget: ${isOverBudget(500, 400)}");
  print("Icon: ${getExpenseIcon('Food')}");
  
  print("Tax (regular): ${calculateTax(1000)}");
  print("Tax (arrow): ${calculateTaxArrow(1000)}");
}