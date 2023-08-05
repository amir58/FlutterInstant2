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

  // Loops ( for, while, do while )
  // Lists
  // Strings
  // Quiz => 10:20

  // while
  print('-------------------');
  print('Start while');
  // variable, condition, ( increment/decrement )
  int x = 0; // 5

  while (x < 5) {
    print(x);
    x++;
  }
  print('End while');

  print('----------------');
  for (int x = 0; x < 5; x++) {
    print(x);
  }

  print('----------------');
  // x = 20
  for (int x = 5; x <= 20; x += 5) {
    print(x);
  }

  print('----------------');
  // continue
  for (int x = 0; x < 5; x++) {
    if (x == 3) {
      continue;
    }
    print(x);
  }

  print('----------------');
  // continue
  for (int x = 0; x < 5; x++) {
    print(x);
    if (x == 3) {
      break;
    }
  }

  print('----------------');
  int y = 0;

  do {
    print(y);
    y++;
  } while (y > 5);

  print('-----------------');
  // Lists
  // CRUD => Create, Read, Update, Delete
  List<String> names = [];
  names.add("Khairy");
  names.add("Elhossiny");
  names.add("Ali Amir");

  List<String> girls = [
    'Esraa',
    'Menna',
    'Mayson',
    'Nirmeen',
    'Rana',
    'Salma',
    'Shahd',
    'Shahd',
  ];

  names.addAll(girls);
  names.addAll(['Ali Hassan', 'Disoky']);
  names.add('Hamdy');
  names.add('Ziad');
  names.add('Raaed');

  print(names); // Read all
  print(names.length);
  // first index = 0 , last index = length - 1
  // names[0] = "Khairy";
  // names[1] = "Elhossiny";
  // names[2] = "Elhossiny";
  // names[15] = "Raaed";
  print(names[15]);
  print(names.elementAt(5));
  print(names.getRange(0, 2));
  print(names.getRange(8, 12));

  // Range error
  // print(names[16]);

  // Range error
  // List<String> testNames = [];
  // testNames[0];

  // Update
  names[11] = "Ahmed";
  print(names);

  // More
  print(names.isEmpty);
  print(names.isNotEmpty);
  print(names.first);
  print(names.last);
  print(names.contains("Ziad"));
  print(names.contains("ziad"));
  // names.clear(); // Delete all names
  print(names.indexOf("Ali Amir"));

  names = names.reversed.toList();

  print(names);

  // Delete ( 5 ways )
  print(names.removeLast());
  print(names.removeAt(1));
  print(names.remove("disoky"));
  print(names.remove("Disoky"));
  print(names);
  names.removeRange(8, 12);
  print(names);
  // print(names.remove("Shahd"));
  names.removeWhere((element) => element == "Shahd");
  print(names);

  print('-------------------------');
  // Strings
  String welcome = "Welcome to flutter course";
  print(welcome.length);
  print(welcome.isEmpty);
  print(welcome.isNotEmpty);
  print(welcome.toUpperCase());
  print(welcome.toLowerCase());
  print(welcome.contains('To'));
  print(welcome.contains('flutter'));
  print(welcome.substring(8, 10));
  print(welcome.split(" "));

  String dateTime = "2023-08-05 9:43PM";
  List<String> dateTimes = dateTime.split(" ");
  print(dateTimes);
  print(dateTimes[0]);
  print(dateTimes[1]);
  String date = dateTimes[0];
  print(date.split('-'));

  String email = " amir@ gmail.com ";
  print(email);
  print(email.replaceAll(" ", ""));
  print(email.trim());
  print(email.trimRight());
  print(email.trimLeft());

  // 01116036002
  // +201116036002 ( VALID )
  // 00201116036002
  // 0111 6036 002
  // +20 111 6036 002
  // 002 0111 6036 002
  // 0111-6036-002
  // +20-111-6036-002
  // 002-0111-6036-002
  print('--------------');
  String phoneNumber = "002 0111 6036-002";
  if (phoneNumber.startsWith("00")) {
    phoneNumber = phoneNumber.replaceFirst("00", "+");
  }
  phoneNumber = phoneNumber.replaceAll(" ", "").replaceAll("-", "");
  print(phoneNumber);
}
