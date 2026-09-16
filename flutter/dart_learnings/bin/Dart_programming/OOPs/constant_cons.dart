class Student {
  final String name;
  final int age;
  const Student(this.name, this.age);

}

void main() {
  const Student s1 = Student("Amit", 21);
  const Student s2 = Student("Amit", 21);

 print(identical(s1, s2)); // true
}