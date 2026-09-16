// void displayStudentinfo(String name, [String? course]) {
//   print("name : $name");
//   print("course : ${course ?? 'Not specified'}");
// }
// void main (){
//   displayStudentinfo("swaraj");
//   print("----------------------------------------");
//   displayStudentinfo("swaraj", "btech");
// }

void employeeInfo({required String name,required int age,})
  {
  print("name : $name");
  print("age : $age");
  }

  void main (){
  print("----------------------------------------");
  employeeInfo(age: 22, name: "swaraj");
  }