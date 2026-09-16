void main() {
  // for (int i=1; i<=10; i++){
  //   print(i);
  // }

  // int num = 5;
  // for (int i = 1; i <= 10; i++) {
  //   print('$num x $i = ${num * i}');
  // }
    
   //sum of first n natural numbers
  // int n = 10;
  // int sum = 0;
  // for (int i = 1; i <= n; i++) {
  //   sum += i;
  // }
  // print('Sum of first $n natural numbers is: $sum');

  //factorial of a number using while loop
  int num = 5;
  int factorial = 1;
  int i = 1;
  while (i <= num) {
    factorial *= i;
    i++;
  }
  print('Factorial of $num is: $factorial');
}
