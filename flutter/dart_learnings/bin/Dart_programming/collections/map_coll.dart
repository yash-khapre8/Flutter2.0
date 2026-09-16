void main(){
  // Map<String, String> student = {
  //   "name": "John",
  //   "age": "20",
  //   "city": "New York"
  // };
  // print(student);

  // //map properties
  // print("length: ${student.length}");
  // print("isEmpty: ${student.isEmpty}");
  // print("keys: ${student.keys}");

  // //accessing values using keys
  // print("name: ${student["name"]}");
  // print("age: ${student["age"]}");
  // print("city: ${student["city"]}");



  Map<String, int> employee = {
    "John": 25,
    "Alice": 30,
    "Bob": 28
  };
  employee["David"] = 35; // Adding a new key-value pair
  employee.remove("Alice"); // Removing a key-value pair
  employee["Bob"] = 29; // Updating the value for a key
  print(employee);

  employee.forEach((name, age) {
    print("$name: $age");
  });

}