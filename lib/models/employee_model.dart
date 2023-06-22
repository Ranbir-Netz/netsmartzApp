class Employee {
  String firstName;
  String? lastName;
  String empID;
  String email;
  String? contact;
  String? img;
  List<String>? authorizations;

  Employee({
    required this.firstName,
    this.lastName,
    required this.email,
    required this.empID,
    this.contact,
    this.img,
    this.authorizations,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      empID: json['empID'],
      contact: json['contact'],
      img: json['img'],
      authorizations: json['authorizations'] != null
          ? List<String>.from(json['authorizations'])
          : null,
    );
  }

  void printDetails() {
    print('''
Name: $firstName
EmpId: $empID 
Authorizations: $authorizations''');
  }
}
