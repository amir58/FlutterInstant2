import 'package:instant2/person.dart';

main() {
  final student = Student(
    name: "Ali",
    age: "20",
    address: "Cairo",
    universityId: "20202346",
  );
  student.printData();
}

class Student extends Person {
  String universityId = "";

  Student({
    required super.name,
    required super.age,
    required super.address,
    required this.universityId,
  });

  @override
  void printData() {
    super.printData();
    print('universityId : $universityId');
  }
}
