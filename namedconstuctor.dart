class Expense {
  double amount;
  String category;
  DateTime date;
  String? description;
  
  // Default constructor
  Expense({
    required this.amount,
    required this.category,
    required this.date,
    this.description
  });
  
  // Named constructor for quick food expense
  Expense.food(double amount, String description)
      : amount = amount,
        category = "Food",
        date = DateTime.now(),
        description = description;
  
  // Named constructor for transport
  Expense.transport(double amount) 
  :amount = amount,
    this.category = "Transport",
    this.date = DateTime.now(),
    this.description = null;
  
  
  // Named constructor from map (useful for JSON)
  Expense.fromMap(Map<String, dynamic> map) 
    :amount = map['amount'],
    category = map['category'],
    date = DateTime.parse(map['date']),
    description = map['description'];
  
  
  void display() {
    print("${category}: ₹${amount} - ${description ?? 'No description'}");
  }
}

void main() {
  // Using different constructors
  var regularExpense = Expense(
    amount: 200,
    category: "Books",
    date: DateTime.now(),
    description: "Flutter book"
  );
  
  var quickFood = Expense.food(80, "Samosa");
  var busRide = Expense.transport(30);
  
  // From map (like API data)
  var apiData = {
    'amount': 120.0,
    'category': 'Entertainment',
    'date': '2025-06-11',
    'description': 'Movie ticket'
  };
  var movieExpense = Expense.fromMap(apiData);
  
  regularExpense.display();
  quickFood.display();
  busRide.display();
  movieExpense.display();
}