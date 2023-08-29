// Variables, Named constructor, Encapsulation => Design

class Person {
  // Global variables => class,    purple, class lifecycle
  // Local variables  => function, white,  function lifecycle
  String name = "";
  String age = "";
  String address = "";

  testVariables(String name){
    // this => global variable
    this.name = name;
    print(name);
  }

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
  }

  Person.male(this.name, this.age, this.address);
  
  Person.female(this.name, this.age, this.address);

  void printData() {
    print('---------------');
    print('Name : $name');
    print('Age : $age');
    print('Address : $address');
  }

}

