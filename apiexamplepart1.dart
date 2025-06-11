Future<String> getUserName()async{
await Future.delayed(Duration(seconds: 3));
return "shahiz";
}

Future<String> fetchDataFromAPI() async {
  try {
    await Future.delayed(Duration(seconds: 1));
    // Simulate random error
    if (DateTime.now().second % 2 == 0) {
      throw Exception("Network error!");
    }
    return "API data received";
  } catch (e) {
    print("Error: $e");
    return "Default data"; // Fallback
  }
}
void main()async {
print("hello world");
String name= await getUserName();
print(name);
print("last line");

 String result = await fetchDataFromAPI();
  print("Result: $result");
}


