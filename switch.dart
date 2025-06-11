void main() {
  String category = "Food";
  String icon;
  
  switch (category) {
    case "Food":
      icon = "🍔";
      break;
    case "Transport":
      icon = "🚗";
      break;
    case "Books":
      icon = "📚";
      break;
    case "Entertainment":
      icon = "🎬";
      break;
    default:
      icon = "💰";
  }
  
  print("Category: $category $icon");
  
  // Modern switch expression (newer Dart)
  // String emoji = switch (category) {
  //   "Food" => "🍔",
  //   "Transport" => "🚗",
  //   "Books" => "📚",
  //   _ => "💰"
  // };
  // print("Using switch expression: $emoji");
  String name =switch(category){
    "Food"=>"hello",_=>"no idea"

  };
  print(name);
}