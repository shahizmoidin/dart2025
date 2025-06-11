void main() {
  double expense = 500;
  double budget = 1000;
  
  if (expense > budget) {
    print("Over budget! Be careful.");
  } else if (expense > budget * 0.8) {
    print("Close to budget limit.");
  } else {
    print("You're within budget.");
  }
  
  // Simple condition
  String message = expense > budget ? "Over budget" : "Safe";
  print("Status: $message");
}