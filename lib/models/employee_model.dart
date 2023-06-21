import 'dart:ui';

class Employee {
  String firstName;
  String? lastName;
  String empID;
  String email;
  String? contact;
  String? img;
  List<String>? authorizations;

  Employee(
      {required this.firstName,
      this.lastName,
      required this.email,
      required this.empID,
      this.contact,
      this.img,
      this.authorizations});

  void printDetails() {
    print('''
Name: $firstName
EmpId: $empID 
Authorizations: $authorizations''');
  }
}
