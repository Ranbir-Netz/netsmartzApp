import 'dart:convert';
import 'package:netsmartz/models/employee_model.dart';
import 'package:netsmartz/models/gate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as bundle;

class DataProvider extends ChangeNotifier {
  DataProvider() {
    getGates();
    getUsers();
  }

  int _activePage = 0;

  int get activePage => _activePage;

  set activePage(int index) {
    _activePage = index;
    notifyListeners();
  }

  List<Gate> _gates = [];

  get gates => _gates;

  getGates() async {
    var rseponse =
        await bundle.rootBundle.loadString("assets/inputs/office_inputs.json");
    final jsonList = jsonDecode(rseponse) as List<dynamic>;
    _gates = jsonList.map((json) => Gate.fromJson(json)).toList();
    notifyListeners();
  }

  List<Employee> _users = [];
  get users => _users;

  getUsers() async {
    var rseponse =
        await bundle.rootBundle.loadString("assets/inputs/user_inputs.json");
    final jsonList = jsonDecode(rseponse) as List<dynamic>;
    _users = jsonList.map((json) => Employee.fromJson(json)).toList();
    notifyListeners();
  }

  addUser(Employee newEmployee) {
    _users.insert(0, newEmployee);
    notifyListeners();
  }

  addGate(Gate newGate) {
    _gates.insert(0, newGate);
    notifyListeners();
  }
}
