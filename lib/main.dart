import 'package:netsmartz/gate_list.dart';

import 'admin_screen.dart';
import 'employee_details.dart';
import 'gate_details.dart';
import 'login.dart';
import 'package:netsmartz/password.dart';
import 'package:netsmartz/provider/data.dart';
import 'package:netsmartz/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:netsmartz/forgot.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: const LoginPage(),
        initialRoute: "/",
        routes: {
          "/login": (context) => const LoginPage(),
          "/forgot": (context) => const Forgot(),
          "/passreset": (context) => const PassReset(),
          "/employee_details": (context) => const EmployeeDetails(),
          "/gate_details": (context) => const GateDetails(),
          "/": (context) => Welcome(),
          "/adminscreen": (context) => DEmo(),
          "/gate_list": (context) => GateList(),
        },
      ),
    ),
  );
}
