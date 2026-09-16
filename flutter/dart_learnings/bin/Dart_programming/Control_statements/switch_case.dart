import 'dart:io';

void main() {
  // int a = 10;
  // int b = 20;
  // stdout.write('Enter an operation (+, -, *, /): ');
  // String? operation = stdin.readLineSync();

  // switch(operation) {
  //   case '+':
  //     print('Addition: ${a + b}');
  //     break;
  //   case '-':
  //     print('Subtraction: ${a - b}');
  //     break;
  //   case '*':
  //     print('Multiplication: ${a * b}');
  //     break;
  //   case '/':
  //     print('Division: ${a / b}');
  //     break;
  //   default:
  //     print('Invalid operation');
  // }

  stdout.write('Enter a number (1-7): ');
  String? day = stdin.readLineSync();

  switch(day) {
    case '1':
      print('Monday');
      break;
    case '2':
      print('Tuesday');
      break;
    case '3':
      print('Wednesday');
      break;
    case '4':
      print('Thursday');
      break;
    case '5':
      print('Friday');
      break;
    case '6':
      print('Saturday');
      break;
    case '7':
      print('Sunday');
      break;
    default:
      print('Invalid day');
  }
}
