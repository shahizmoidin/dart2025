class ExpenseTracker {
  static String appName = "My Expense Tracker";
  static double totalBudget = 10000;
  static List<String> categories = ["Food", "Transport", "Books", "Entertainment"];
  
  // Static method - can be called without creating object
  static String getCategoryIcon(String category) {
    switch (category) {
      case "Food": return "🍔";
      case "Transport": return "🚗";
      case "Books": return "📚";
      case "Entertainment": return "🎬";
      default: return "💰";
    }
  }
  
  static bool isValidCategory(String category) {
    return categories.contains(category);
  }
  
  static void showAppInfo() {
    print("App: $appName");
    print("Budget: ₹$totalBudget");
    print("Categories: ${categories.join(', ')}");
  }
}

void main() {
  // Using static members without creating object
  ExpenseTracker.showAppInfo();
  
  print("Food icon: ${ExpenseTracker.getCategoryIcon('Food')}");
  print("Is 'Food' valid? ${ExpenseTracker.isValidCategory('Food')}");
  print("Is 'Gaming' valid? ${ExpenseTracker.isValidCategory('Gaming')}");
  
  // You can't do this - static members belong to class, not object
  // var tracker = ExpenseTracker();
  // tracker.showAppInfo(); // This won't work
}