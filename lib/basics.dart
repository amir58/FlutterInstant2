main() {
  print('HelloWorld');
  print("HelloWorld!");
  print("hello world!");
  print(87564974);

  // Comment
  // Data Types => String, int, double, bool, List of String, Map
  // String => 'text', "text"
  // int => 1, 3, 6, 10, 4000, 99563
  // double => 1.2 , 3.5, 99.9
  // bool => true , false
  // List of String => ['one', 'two', 'three'];

  // Define a variable
  // DataType variableName = value;

  String name = 'Ali';
  int age = 20;
  double c = 2.8;
  bool isWorking = true;
  List<String> languages = ['Arabic', 'English'];

  // sout
  print('------------------');
  print('Name : $name');
  print('Age : $age');
  print('C : $c');
  print('Is working : $isWorking');
  print('Languages : $languages');

  // Naming
  // اسم معبر
  // int age, numberOne, carsCount
  // int x,y,z, p1,p2,p3 => Wrong

  // variables, functions => camelCase
  // isworking => isWorking
  // numberone => numberOne
  // getuserdatafromserver => getUserDataFromServer

  // classes => PascalCase
  // LoginScreen, RegisterScreen, ForgetPasswordScreen

  // files => small_letters_with_under_scores
  // main, basics, login_screen, register_screen, forget_password_screen

  // Rules => letters ( a:z ) _ $
  // 0:9 , spaces , any character => WRONG

  int num = 5;
  int numOne = 5;
  int _num = 5;
  int $num = 5;

  // int 1num = 5;
  // int #num = 5;
  // int @num = 5;
  // int !num = 5;
  // int num One = 5;

  print(num);
  print(numOne);
  print(_num);
  print($num);

  // function => functionName();
  // variable => varName;

  int numberOne = 10;
  int numberTwo = 11;

  // + , - , * , / , % , = , ++ , --
  int result = numberOne + numberTwo;
  print('Result : $result');

  print('Result : $numberOne + numberTwo'); // Wrong
  print('Result : $numberOne + $numberTwo'); // Wrong
  print('Result : ${numberOne + numberTwo}');
  print('$numberOne + $numberTwo = ${numberOne + numberTwo}');
  print('$numberOne - $numberTwo = ${numberOne - numberTwo}');
  print('$numberOne * $numberTwo = ${numberOne * numberTwo}');
  print('$numberOne / $numberTwo = ${numberOne / numberTwo}');
  print('$numberOne % $numberTwo = ${numberOne % numberTwo}');

  print("Number one : $numberOne");
  numberOne + 1; // WRONG
  11; // UNUSED
  print("Number one : $numberOne");
  numberOne = numberOne + 1;
  print("Number one : $numberOne");
  numberOne++; // Increment
  print("Number one : $numberOne");
  numberOne--; // Decrement
  print("Number one : $numberOne");

  // < , <= , > , >= , == , !=
  //            11           5
  print('$numberOne > $numberTwo = ${numberOne > numberTwo}');
  print('$numberOne >= $numberTwo = ${numberOne >= numberTwo}');

  print('$numberOne < $numberTwo = ${numberOne < numberTwo}');
  print('$numberOne <= $numberTwo = ${numberOne <= numberTwo}');

  print('$numberOne == $numberTwo = ${numberOne == numberTwo}');
  print('$numberOne != $numberTwo = ${numberOne != numberTwo}');

  print('------------------');
  // && || !
  // += -= *= /= %=
  // ? ! ?? ??= ( OOP )
  // ? :
  // is is!

  // && => And
  // || => Or
  // !  => Not

  print(!true); // Not true  = false
  print(!false); // Not false = true

  bool test = false;
  print(!test); // Not false = true

  print('---------------');
  // And &&
  // Is 10 in range 5..15
  int num1 = 4;
  print(num1 > 5 && num1 < 15);

  // Or ||
  print(num1 > 5 || num1 < 15);

  print('-------------');
  // += -= *= /= %=
  double num2 = 15;
  // num2 = num2 + 5;
  num2 += 5;
  print(num2);

  // num2 = num2 * 5;
  num2 *= 5;
  print(num2);

  // num2 = num2 / 4;
  num2 /= 4;
  print(num2);

  // num2 = num2 - 5;
  num2 -= 5;
  print(num2);

  // num2 = num2 % 5;
  num2 %= 5;
  print(num2);

  // is is! => DataType

  int a = 5;
  print(a is String);
  print(a is bool);
  print(a is int);
  print(a is! double);

  print('---------------');
  // ? : => simple condition
  // condition ? resultOne (true) : resultTwo (false)
  // condition ? Colors.green : Colors.red
  // condition ? Icons.success : Icons.failure

  String message = 10 > 50 ? "Yes" : "No";
  print(message);
  int ternaryResult = 20 >= 20 ? 1 : 0;
  print(ternaryResult);

  // Conditions => if condition , switch case
  // if ( condition ) { body } else { body }

  print('amir' == 'amir');
  print('Amir' == 'amir');

  if (10 < 5) {
    print('10 Bigger than 5');
  } else {
    print('10 smaller than 5');
  }

  int num3 = 20;
  if (num3 > 5 && num3 < 15) {
    print('num3 is a valid number');
  } else {
    print('num3 is a not valid number');
  }

  // String message = 10 > 50 ? "Yes" : "No";

  if (10 > 50) {
    print('Yes');
  } else {
    print('No');
  }

  // requested , accept , reject , onTheWay , delivered , refused , cancelled
  String orderStatus = "reject";

  if (orderStatus == "requested") {
    print('Order status : requested');
  } else if (orderStatus == "accept") {
    print('Order status : accept');
  } else if (orderStatus == "reject") {
    print('Order status : reject');
  } else {
    print('Order status : unknown');
  }

  if (orderStatus == "requested")
    print('Order status : requested');
  else if (orderStatus == "accept")
    print('Order status : accept');
  else if (orderStatus == "reject")
    print('Order status : reject');
  else
    print('Order status : unknown');

  // switch ( variable ) { body }
  // switch ( variable ) { case requested : { case body } break; }
  switch (orderStatus) {
    case "requested":
      {
        print('Order status : requested');
      }
      break;
    case "accept":
      {
        print('Order status : accept');
      }
      break;
    default:
      {
        print('Order status : unknown');
      }
  }

  int dayOfWeek = 2;

  switch (dayOfWeek) {
    case 1:
      break;
    case 1:
      print('Saturday');
      break;
    case 2:
      print('Sunday');
      break;
    case 3:
      print('Monday');
      break;
    default:
      print('Invalid day number');
  }
}
