void main() {
  // int - Integer type
  int age = 25;
  print('age: $age');

  // double - Floating point type
  double height = 5.9;
  print('height: $height');

  // String - Text type
  String name = 'Dart';
  print('name: $name');

  // bool - Boolean type
  bool isActive = true;
  print('isActive: $isActive');

  // List - Ordered collection
  List<int> numbers = [1, 2, 3, 4, 5];
  print('numbers: $numbers');

  // Map - Key-value pairs
  Map<String, int> scores = {'Math': 90, 'Science': 85};
  print('scores: $scores');

  // Set - Unique values
  Set<String> fruits = {'Apple', 'Banana', 'Orange'};
  print('fruits: $fruits');

  // dynamic - Can hold any type
  dynamic variable = 'Hello';
  print('dynamic (String): $variable');
  variable = 42;
  print('dynamic (int): $variable');

  // var - Type inference
  var city = 'New York';
  print('city: $city');

  // null - Nullable types
  String? nullableString = null;
  print('Nullable String: $nullableString');

}
