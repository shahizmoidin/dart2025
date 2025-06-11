Future<String> fetchUserName() async {
  // Simulate network delay
  await Future.delayed(Duration(seconds: 1));
  return "Priya Sharma";
}

Future<double> fetchExchangeRate() async {
  await Future.delayed(Duration(seconds: 2));
  return 83.25;
}

Future<double> convertCurrency(double inrAmount) async {
  print("Converting ₹$inrAmount to USD...");
  double rate = await fetchExchangeRate();
  double usdAmount = inrAmount / rate;
  return usdAmount;
}

Future<void> showUserInfo() async {
  print("Loading user info...");
  String name = await fetchUserName();
  print("User: $name");
  
  double usdValue = await convertCurrency(1000);
  print("₹1000 = \$${usdValue.toStringAsFixed(2)}");
}

void main() async {
  print("App starting...");
  await showUserInfo();
  print("App ready!");
}