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

  factory Gate.fromJson(Map<String, dynamic> json) {
    return Gate(
      gateName: json['gateName'] as String,
      gateID: json['gateID'] as String,
      img: json['img'],
      managerId: json['managerId'],
    );
  }

  void printDetails() {
    print(
        '''
Gate Name: $gateName
Gate ID: $gateID
Manager ID: $managerId 
''');
  }
}
