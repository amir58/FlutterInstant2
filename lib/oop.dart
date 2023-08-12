// OOP => Encapsulation, Inheritance, Abstraction, Polymorphism
// OOP => class, object, enum, mixin

// class => container ( variables, functions )
// class ClassName{ class body }
// To define an object :
// ClassName objectName = ClassName();

import 'package:instant2/person.dart';

main() {
  Person person1 = Person(
    name: "Ahmed",
    age: "15",
    address: "Cairo",
  );

  Person person2 = Person(name: "Ali", age: "18", address: "Alex");

  String name1 = "Ahmed";
  String age1 = "18";
  String address1 = "Cairo";

  print('-------------------');
  print('Name : $name1');
  print('Age : $age1');
  print('Address : $address1');

  String name2 = "Ahmed";
  String age2 = "28";
  String address2 = "Cairo";

  print('-------------------');
  print('Name : $name2');
  print('Age : $age2');
  print('Address : $address2');

  String name3 = "Ahmed";
  String age3 = "38";
  String address3 = "Cairo";

  print('-------------------');
  print('Name : $name3');
  print('Age : $age3');
  print('Address : $address3');
}
