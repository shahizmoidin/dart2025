void main() {
  List<double> expenses = [100, 250, 75, 300];
  
  // Anonymous function with forEach
  print("All expenses:");
  expenses.forEach((expense) {
    print("Amount: ₹$expense");
  });
  
  // Anonymous function with where (filtering)
  var highExpenses = expenses.where((expense) => expense > 100);
  print("High expenses: $highExpenses");
  
  // Anonymous function with map (transforming)
  var formattedExpenses = expenses.map((expense) => "₹${expense.toStringAsFixed(2)}");
  print("Formatted: $formattedExpenses");
  
  // Closure - function that remembers variables from outer scope
  Function createBudgetChecker(double budget) {
    return (double expense) {
      if (expense > budget) {
        return "Over budget by ₹${expense - budget}";
      } else {
        return "Within budget. Remaining: ₹${budget - expense}";
      }
    };
  }
  
  var foodBudgetChecker = createBudgetChecker(1000);
  print(foodBudgetChecker(800));  // Within budget
  print(foodBudgetChecker(1200)); // Over budget
}