Future<Map<String, double>> fetchExchangeRates() async {
  await Future.delayed(Duration(seconds: 1));
  
  // Simulate random failure
  if (DateTime.now().millisecond % 2 == 0) {
    throw Exception("Network error: Unable to fetch rates");
  }
  
  return {
    "USD": 83.25,
    "EUR": 90.50,
    "GBP": 105.75
  };
}

Future<void> showCurrencyRates() async {
  try {
    print("Fetching exchange rates...");
    Map<String, double> rates = await fetchExchangeRates();
    
    print("Exchange rates:");
    rates.forEach((currency, rate) {
      print("1 $currency = ₹$rate");
    });
  } catch (error) {
    print("Error occurred: $error");
    print("Using cached rates...");
    // Show cached/default rates
  }
}

void main() async {
  await showCurrencyRates();
}