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

}
