import 'package:netsmartz/models/employee_model.dart';
import 'package:netsmartz/models/gate_model.dart';
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  int _activePage = 0;

  int get activePage => _activePage;

  set activePage(int index) {
    _activePage = index;
    notifyListeners();
  }

  List<Gate> _offices = [
    Gate(
        gateID: "1a",
        gateName: "Main Gate",
        img: "assets/images/chandigarh.jpg"),
    Gate(gateID: "1b", gateName: "Exit", img: "assets/images/sebiz.jpg"),
    Gate(gateID: "2", gateName: "Break Room", img: "assets/images/noida.jpg"),
    Gate(
        gateID: "3", gateName: "Confidential", img: "assets/images/mohali.jpg"),
    Gate(
        gateID: "3b",
        gateName: "Meeting Room",
        img: "assets/images/gurugram.jpg")
  ];

  get offices => _offices;

  List<Employee> _users = [
    Employee(
      firstName: "dob",
      email: "1@gmail.com",
      empID: "125",
      img: "assets/images/download.jpeg",
    ),
    Employee(
      firstName: "Bob",
      email: "2@gmail.com",
      empID: "2125",
      img: "assets/images/download.jpeg",
    ),
    Employee(
      firstName: "cob",
      email: "31@gmail.com",
      empID: "3125",
      img: "assets/images/download.jpeg",
    ),
    Employee(
      firstName: "Bob",
      email: "41@gmail.com",
      empID: "4125",
      img: "assets/images/download.jpeg",
    ),
    Employee(
      firstName: "Bob",
      email: "51@gmail.com",
      empID: "5125",
      img: "assets/images/download.jpeg",
    ),
    Employee(
      firstName: "rob",
      email: "61@gmail.com",
      empID: "6125",
      img: "assets/images/download.jpeg",
    ),
    Employee(
      firstName: "Bob",
      email: "71@gmail.com",
      empID: "7125",
      img: "assets/images/download.jpeg",
    ),
    Employee(
      firstName: "Bob",
      email: "81@gmail.com",
      empID: "8125",
      img: "assets/images/download.jpeg",
    ),
    Employee(
      firstName: "Bob",
      email: "91@gmail.com",
      empID: "9125",
      img: "assets/images/download.jpeg",
    ),
  ];

  get users => _users;
}
