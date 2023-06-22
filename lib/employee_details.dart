import 'package:flutter/material.dart';
import 'package:netsmartz/provider/data.dart';
import 'package:provider/provider.dart';
import 'models/gate_model.dart';
import 'models/employee_model.dart';

import 'custom/text_field_custom.dart';

class EmployeeDetails extends StatefulWidget {
  const EmployeeDetails({super.key});

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  List<String> authorizations = [];
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController empID = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(59, 82, 82, 82),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Create User",
          style: TextStyle(
            color: Colors.white,
            fontSize: 38,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromRGBO(255, 120, 79, 1),
              Colors.orange,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.height - 20,
                  height: MediaQuery.of(context).size.height - 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 117, 117, 117),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Stack(children: [
                          const CircleAvatar(
                            radius: 60,
                            // backgroundColor: Colors.grey,
                            backgroundImage:
                                AssetImage("assets/images/profile.jpg"),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.camera_alt_sharp,
                                size: 35,
                              ),
                            ),
                          )
                        ]),
                        const SizedBox(
                          height: 45,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFieldCustom(
                              label: "First Name",
                              height: 40,
                              width: 160,
                              controller: fname,
                            ),
                            TextFieldCustom(
                              label: "Last Name",
                              height: 40,
                              width: 160,
                              controller: lname,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFieldCustom(
                              label: "Employee ID",
                              height: 40,
                              width: 160,
                              controller: empID,
                            ),
                            TextFieldCustom(
                              label: "Contact No.",
                              height: 40,
                              width: 160,
                              controller: contact,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFieldCustom(
                          label: "Employee Email",
                          height: 40,
                          width: 340,
                          controller: email,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          "Authorizations",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(221, 58, 58, 58),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Consumer<DataProvider>(
                          builder: (context, gates, child) {
                            List<Gate> snap = gates.gates;
                            return Container(
                              height: 190,
                              width: 330,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 240, 240, 240),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: ListView.builder(
                                padding: const EdgeInsets.all(0),
                                itemCount: snap.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          CheckboxListTile(
                                              value: authorizations
                                                  .contains(snap[index].gateID),
                                              title: Text(
                                                snap[index].gateName,
                                                style: const TextStyle(
                                                    fontSize: 18),
                                              ),
                                              activeColor: Colors.orange,
                                              dense: true,
                                              onChanged: (bool? val) {
                                                if (val == true) {
                                                  setState(() {
                                                    authorizations.insert(
                                                        0, snap[index].gateID);
                                                  });
                                                } else {
                                                  setState(() {
                                                    authorizations.remove(
                                                        snap[index].gateID);
                                                  });
                                                }
                                              }),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Employee newEmployee = Employee(
                                firstName: fname.text,
                                lastName: lname.text,
                                email: email.text,
                                contact: contact.text,
                                empID: empID.text,
                                authorizations: authorizations,
                                img: "assets/images/profile.jpg");
                            newEmployee.printDetails();
                            Provider.of<DataProvider>(context, listen: false)
                                .addUser(newEmployee);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            height: 45,
                            width: 330,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
