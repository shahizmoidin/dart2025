import 'dart:convert';
import 'package:http/http.dart' as http;

class ExchangeAPI {
  static const String apiKey = "e6715d56d924667ecebbe3c7";
  
  // Get exchange rates
  static Future<Map<String, double>> getRates() async {
    try {
      String url = "https://v6.exchangerate-api.com/v6/$apiKey/latest/USD";
      
      // Make API call
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        // Parse JSON response
        final data = json.decode(response.body);
        
        Map<String, double> rates = {};
        Map<String, dynamic> conversionRates = data['conversion_rates'];
        
        // Convert to our format
        conversionRates.forEach((currency, rate) {
          rates[currency] = rate.toDouble();
        });
        
        return rates;
      } else {
        throw Exception("Failed to load rates");
      }
    } catch (e) {
      print("API Error: $e");
      // Return fallback data
      return {"INR": 83.0, "EUR": 0.9, "GBP": 0.8};
    }
  }
  
  // Convert currency
  static Future<double> convertCurrency(double amount, String from, String to) async {
    try {
      String url = "https://v6.exchangerate-api.com/v6/$apiKey/pair/$from/$to/$amount";
      
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['conversion_result'].toDouble();
      } else {
        throw Exception("Conversion failed");
      }
    } catch (e) {
      print("Conversion Error: $e");
      return 0.0;
    }
  }
}

// Usage Example
void main() async {
  print("📱 Exchange Rate App");
  
  // Get latest rates
  Map<String, double> rates = await ExchangeAPI.getRates();
  print("1 USD = ₹${rates['INR']} INR");
  print("1 USD = €${rates['EUR']} EUR");
  
  // Convert currency
  double result = await ExchangeAPI.convertCurrency(100, "USD", "INR");
  print("100 USD = ₹$result INR");
}