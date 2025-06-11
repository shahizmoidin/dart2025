import 'dart:convert';
import 'package:http/http.dart' as http;

// Expense model
class Expense {
  double amount;
  String category;
  DateTime date;
  
  Expense(this.amount, this.category, this.date);
  
  String get formatted => "₹${amount.toStringAsFixed(2)}";
}

// Expense tracker with currency conversion
class ExpenseTracker {
  List<Expense> _expenses = [];
  Map<String, double> _exchangeRates = {};
  
  List<Expense> get expenses => _expenses;
  
  // Load exchange rates
  Future<void> updateRates() async {
    try {
      _exchangeRates = await ExchangeAPI.getRates();
      print("✅ Exchange rates updated");
    } catch (e) {
      print("❌ Failed to update rates: $e");
    }
  }
  
  // Add expense
  void addExpense(double amount, String category) {
    _expenses.add(Expense(amount, category, DateTime.now()));
    print("Added: ₹$amount for $category");
  }
  
  // Get total in different currencies
  double getTotalInUSD() {
    double total = _expenses.fold(0, (sum, expense) => sum + expense.amount);
    if (_exchangeRates.containsKey('INR')) {
      return total / _exchangeRates['INR']!;
    }
    return total / 83.0; // Fallback rate
  }
  
  // Show summary
  void showSummary() {
    double totalINR = _expenses.fold(0, (sum, expense) => sum + expense.amount);
    double totalUSD = getTotalInUSD();
    
    print("\n📊 Expense Summary:");
    print("Total: ₹${totalINR.toStringAsFixed(2)}");
    print("Total: \$${totalUSD.toStringAsFixed(2)}");
    print("Number of expenses: ${_expenses.length}");
  }
}

// Demo
void main() async {
  print("💰 Smart Expense Tracker\n");
  
  var tracker = ExpenseTracker();
  
  // Update exchange rates
  await tracker.updateRates();
  
  // Add some expenses
  tracker.addExpense(150, "Food");
  tracker.addExpense(50, "Transport");
  tracker.addExpense(200, "Books");
  
  // Show summary
  tracker.showSummary();
}