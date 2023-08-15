// OOP => Encapsulation, Inheritance, Abstraction, Polymorphism
// OOP => class, object, enum, mixin
// class => container ( variables, functions )

// class ClassName{ class body }
// To define an object :
// ClassName objectName = ClassName();

import 'package:instant2/phone.dart';

main() {
  Phone phone1 = Phone.android(name: "S20", price: 15000);
  // phone1.os = "iOS";
  // phone1.price = -5000;
  phone1.setPrice(-5000);
  phone1.printData();
  print(phone1.getOperatingSystem());

  Phone phone2 = Phone.iOS(name: "iPhone 15", price: 50000);
  phone2.printData();
}
