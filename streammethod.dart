import 'dart:async';

// Create a stream of expense updates
Stream<String> expenseNotifications() async* {
  await Future.delayed(Duration(seconds: 1));
  yield "New expense: ₹150 for Food";
  
  await Future.delayed(Duration(seconds: 2));
  yield "New expense: ₹50 for Transport";
  
  await Future.delayed(Duration(seconds: 1));
  yield "Budget warning: 80% used!";
  
  await Future.delayed(Duration(seconds: 2));
  yield "New expense: ₹200 for Books";
}

// Stream of currency rates (simulating real-time updates)
Stream<double> currencyRateStream() async* {
  double baseRate = 83.0;
  
  while (true) {
    await Future.delayed(Duration(seconds: 3));
    // Simulate rate fluctuation
    double fluctuation = (DateTime.now().millisecond % 100 - 50) / 100;
    double currentRate = baseRate + fluctuation;
    yield currentRate;
  }
}

void main() async {
  print("Starting expense tracker...");
  
  // Listen to expense notifications
  print("\n--- Expense Notifications ---");
  await for (String notification in expenseNotifications()) {
    print("📱 $notification");
  }
  
  print("\n--- Currency Rate Updates ---");
  // Listen to currency rates (first 3 updates only)
  int count = 0;
  await for (double rate in currencyRateStream()) {
    print("💱 1 USD = ₹${rate.toStringAsFixed(2)}");
    count++;
    if (count >= 3) break;
  }
  
  print("Demo completed!");
}