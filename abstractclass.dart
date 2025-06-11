// Abstract class - cannot create objects directly
abstract class Shape {
  String name;
  
  Shape(this.name);
  
  // Abstract method - must be implemented by child classes
  double calculateArea();
  
  // Regular method - can be inherited as is
  void display() {
    print("Shape: $name, Area: ${calculateArea()}");
  }
}

class Rectangle extends Shape {
  double length;
  double width;
  
  Rectangle(this.length, this.width) : super("Rectangle");
  
  @override
  double calculateArea() {
    return length * width;
  }
}

class Circle extends Shape {
  double radius;
  
  Circle(this.radius) : super("Circle");
  
  @override
  double calculateArea() {
    return 3.14159 * radius * radius;
  }
}

void main() {
  // Shape shape = Shape("Generic"); // Error - cannot create abstract class object
  
  var rectangle = Rectangle(10, 5);
  var circle = Circle(7);
  
  rectangle.display();
  circle.display();
  
  // Polymorphism with abstract class
  List<Shape> shapes = [rectangle, circle];
  for (var shape in shapes) {
    shape.display();
  }
}