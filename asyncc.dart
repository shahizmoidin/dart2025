// Simulate API call delay
Future<String> fetchUserName() {
  return Future.delayed(Duration(seconds: 2), () {
    return "Rahul Kumar";
  });
}

Future<double> fetchExchangeRate() {
  return Future.delayed(Duration(seconds: 1), () {
    return 83.25; // 1 USD = 83.25 INR
  });
}

void main() {
  print("Starting app...");
  
  // Using .then() method
  fetchUserName().then((name) {
    print("Welcome, $name!");
  });
  
  fetchExchangeRate().then((rate) {
    print("Exchange rate: 1 USD = ₹$rate");
  });
  
  print("App is ready to use!");
  // This prints immediately, before the futures complete
}