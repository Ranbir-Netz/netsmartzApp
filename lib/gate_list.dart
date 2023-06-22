import 'package:flutter/material.dart';
import 'package:netsmartz/provider/data.dart';
import 'package:provider/provider.dart';

import 'models/employee_model.dart';
import 'models/gate_model.dart';

class GateList extends StatefulWidget {
  GateList({super.key}) {}

  @override
  State<GateList> createState() => _GateListState();
}

class _GateListState extends State<GateList> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String gateID = ModalRoute.of(context)!.settings.arguments as String;
    Gate gate = Provider.of<DataProvider>(context).getGateByID(gateID);
    List<Employee> users =
        Provider.of<DataProvider>(context).getEmployeebyGateID(gateID);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.edit,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 255, 145, 0),
        title: Text(
          gate.gateName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 34,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        hintText: 'Search users',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          if (_searchController.text.isNotEmpty &&
                              (!users[index].firstName.toLowerCase().contains(
                                      _searchController.text.toLowerCase()) &&
                                  !users[index].email.toLowerCase().contains(
                                      _searchController.text.toLowerCase()))) {
                            return Container(); // Return an empty container if the user doesn't match the search input
                          }

                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(186, 186, 186, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 20, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 40,
                                          foregroundImage:
                                              AssetImage(users[index].img!),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("${users[index].empID}"),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(users[index].firstName),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(users[index].email),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/employee_details");
              },
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 145, 0),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 95, 95, 95), blurRadius: 5)
                    ],
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    )),
                child: Center(
                  child: Text(
                    "Add User",
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
    );
  }
}
