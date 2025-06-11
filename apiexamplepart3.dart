import 'dart:async';

import 'apiexampleepart2.dart';

// Simple stream example
Stream<int> countdownStream() async* {
  for (int i = 5; i >= 1; i--) {
    await Future.delayed(Duration(seconds: 1));
    yield i; // Send data to stream
  }
}

// Real-time exchange rate stream
class LiveRateStream {
  final StreamController<double> _controller = StreamController<double>();
  Timer? _timer;
  
  Stream<double> get rateStream => _controller.stream;
  
  void startUpdates() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      try {
        Map<String, double> rates = await ExchangeAPI.getRates();
        _controller.add(rates['INR']!); // Send INR rate
      } catch (e) {
        _controller.addError("Rate update failed");
      }
    });
  }
  
  void stop() {
    _timer?.cancel();
    _controller.close();
  }
}

void main() async {
  print("🔄 Stream Examples");
  
  // Simple countdown stream
  print("Countdown:");
  await for (int count in countdownStream()) {
    print("$count...");
  }
  print("Done!");
  
  // Live rate updates
  var liveRates = LiveRateStream();
  
  liveRates.rateStream.listen((rate) {
    print("💰 Current rate: 1 USD = ₹$rate INR");
  });
  
  liveRates.startUpdates();
  
  // Stop after 30 seconds
  await Future.delayed(Duration(seconds: 30));
  liveRates.stop();
}