// class Student {
//   String name;
//   int age;
//   Student(this.name, this.age);

//   void display() {
//     print(name);
//     print(age);
//   }
// }

// void main() {
//   Student s = Student("amit", 21);
//   s.display();
// }

class Employee {
  String? name;

  Employee.manager(){
    name="manager";
  }
}

void main() {
  Employee e = Employee.manager();
  print(e.name);
}
