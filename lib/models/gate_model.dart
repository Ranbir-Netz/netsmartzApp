import 'dart:ui';

class Gate {
  String gateName;
  String gateID;
  String? managerId;
  String? img;

  Gate({
    required this.gateName,
    required this.gateID,
    this.managerId,
    this.img,
  });

  void printDetails() {
    print('''
Gate Name: $gateName
Gate ID: $gateID
Manager ID: $managerId 
''');
  }
}
