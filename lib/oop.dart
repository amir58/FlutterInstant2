// OOP => Encapsulation, Inheritance, Abstraction, Polymorphism
// OOP => class, object, enum, mixin
// class => container ( variables, functions )

// class ClassName{ class body }
// To define an object :
// ClassName objectName = ClassName();

import 'package:instant2/inheritance/home_screen.dart';
import 'package:instant2/phone.dart';

main() {
  final phone1 = Phone.android(name: "S20", price: 15000);
  final phone2 = Phone.iOS(name: "iPhone 13", price: 25000);

  List<Phone> phones = [];
  phones.add(phone1);
  phones.add(phone2);

  print(phones);

  for (int i = 0; i < phones.length; i++) {
    print(phones[i]);
  }
  print('-----------------');
  phones.forEach((element) {
    print(element);
  });
  print('-----------------');
  for (var phone in phones) {
    print(phone);
  }

  // HomeScreen homeScreen = HomeScreen();
  // homeScreen.execute();

  // Phone phone1 = Phone.android(name: "S20", price: 15000);
  // // phone1.os = "iOS";
  // // phone1.price = -5000;
  // phone1.setPrice(-5000);
  // phone1.printData();
  // print(phone1.getOperatingSystem());
  //
  // Phone phone2 = Phone.iOS(name: "iPhone 15", price: 50000);
  // phone2.printData();

  final int numberOne = 0; // Runtime
  const int numberTwo = 0; // Compile time

  // numberOne = 1; // WRONG
  // numberTwo = 2; // WRONG
}

class Test {
  final String name;

  Test({required this.name});
}
