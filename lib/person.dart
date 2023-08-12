class Person {
  String name = "";
  String age = "";
  String address = "";

  // Constructor
  // 1 : function
  // 2 : ClassName
  // 3 : no return type
  // 4 : called when take an object
  // 5 : body is optional
  Person({
    required this.name,
    required this.age,
    required this.address,
  }) {
    print('New object from Person class');
    printData();
  }

  void printData() {
    print('---------------');
    print('Name : $name');
    print('Age : $age');
    print('Address : $address');
  }

}

