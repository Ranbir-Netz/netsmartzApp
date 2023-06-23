import 'package:flutter/material.dart';
import 'package:netsmartz/provider/data.dart';
import 'package:provider/provider.dart';
import 'models/gate_model.dart';

import 'custom/text_field_custom.dart';

class UpdateGate extends StatefulWidget {
  const UpdateGate({super.key});

  @override
  State<UpdateGate> createState() => _UpdateGateState();
}

class _UpdateGateState extends State<UpdateGate> {
  TextEditingController gateName = TextEditingController();
  TextEditingController gateID = TextEditingController();
  TextEditingController managerID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)!.settings.arguments as String;
    Gate g = Provider.of<DataProvider>(context).getGateByID(id);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(59, 82, 82, 82),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Edit Gate",
          style: TextStyle(
            color: Colors.white,
            fontSize: 38,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromRGBO(255, 120, 79, 1),
              Colors.orange,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.height - 20,
                height: 480,
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
                      TextFieldCustom(
                        label: g.gateName,
                        height: 40,
                        width: 340,
                        controller: gateName,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFieldCustom(
                        label: g.gateID,
                        height: 40,
                        width: 340,
                        controller: gateID,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFieldCustom(
                        label: g.managerId ?? "Manager ID (optional)",
                        height: 40,
                        width: 340,
                        controller: managerID,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        onPressed: () {
                          print("Executed");
                          if (g.gateName != gateName.text &&
                              gateName.text != "") {
                            g.gateName = gateName.text;
                          }
                          if (g.gateID != gateID.text && gateID.text != "") {
                            g.gateID = gateID.text;
                          }
                          if (g.managerId != managerID.text &&
                              managerID.text != "") {
                            g.managerId = managerID.text;
                          }
                          Gate newGate = Gate(
                            gateName: g.gateName,
                            gateID: g.gateID,
                            managerId: g.managerId,
                            img: g.img,
                          );
                          newGate.printDetails();
                          Provider.of<DataProvider>(context, listen: false)
                              .updateGate(newGate, id);
                          Navigator.popAndPushNamed(context, "/gate_list",
                              arguments: g.gateID);
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
    );
  }
}
