// void addNumbers(int a, int b){
//     print("sum = ${a+b}");
// }
// void main(){
//     addNumbers(10, 20);
// }

// int multiply(int a, int b) {
//     return a * b;
// }
// void main(){
//     int result = multiply(5 , 6);
//     print("multiplication = $result");
// }

String checkEvenOdd(int num) {
  if (num % 2 == 0) {
    return '$num is even';
  } else {
    return '$num is odd';
  }
}

void main (){
  print(checkEvenOdd(10));
  print(checkEvenOdd(15));
}