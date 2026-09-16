import 'dart:io';
void main() {
  // int num = 10;

  // if (num%2 == 0) {
  //   print('$num is even');
  // } else {
  //   print('$num is odd');
  // }

  // int a = 20;
  // int b = 30;
  // int c = 40;
  // // largest number
  // if (a > b && a > c) {
  //   print('$a is the largest number');
  // } else if (b > a && b > c) {
  //   print('$b is the largest number');
  // } else {  
  //   print('$c is the largest number');
  // }
 
  stdout.write('Enter your marks: ');
  int marks = int.parse(stdin.readLineSync() ?? '0');

  if (marks >= 90) {
    print('Grade: A');
  } else if (marks >= 80) {
      print('Grade: B');
    } else if (marks >= 70) {
      print('Grade: C');
    } else if (marks >= 60) {
      print('Grade: D');
    } else {
      print('Grade: F');
    }
  } 
  


