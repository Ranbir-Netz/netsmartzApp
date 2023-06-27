import 'package:netsmartz/models/employee_model.dart';
import 'package:netsmartz/models/gate_model.dart';
import 'package:flutter/material.dart';
import 'comps/drawer.dart';
import 'provider/data.dart';
import 'package:provider/provider.dart';
import 'package:netsmartz/edit_employee.dart';

class DEmo extends StatefulWidget {
  const DEmo({Key? key}) : super(key: key);

  @override
  State<DEmo> createState() => _DEmoState();
}

class _DEmoState extends State<DEmo> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);
  GlobalKey<ScaffoldState> _scaffold_key = GlobalKey<ScaffoldState>();

  TextEditingController _searchController = TextEditingController();
  TextEditingController _gateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold_key,
      endDrawer: CustomDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(250, 250, 250, 1),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 70,
                    child: Image.asset("assets/images/logo.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      _scaffold_key.currentState!.openEndDrawer();
                    },
                    child: Icon(Icons.menu),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  physics: BouncingScrollPhysics(),
                  controller: _tabController,
                  children: [
                    Consumer<DataProvider>(
                      builder: (context, value, child) {
                        List<Employee> users = value.users;
                        return Column(
                          children: [
                            TextField(
                              controller: _searchController,
                              onChanged: (value) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                hintText: 'Search Users',
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
                                      (!users[index]
                                              .firstName
                                              .toLowerCase()
                                              .contains(_searchController.text
                                                  .toLowerCase()) &&
                                          !users[index]
                                              .email
                                              .toLowerCase()
                                              .contains(_searchController.text
                                                  .toLowerCase()) &&
                                          !users[index]
                                              .empID
                                              .toLowerCase()
                                              .contains(_searchController.text
                                                  .toLowerCase()))) {
                                    return Container(); // Return an empty container if the user doesn't match the search input
                                  }

                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 20, 5),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EditDetails(index: index),
                                            ));
                                      },
                                      child: Container(
                                        height: 100,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                226, 226, 226, 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 196, 195, 195),
                                                blurRadius: 2,
                                                spreadRadius: 4,
                                              ),
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 20, 0),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 40,
                                                foregroundImage: AssetImage(
                                                    users[index].img!),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            users[index]
                                                                .firstName,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Emp. ID: ${users[index].empID}",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        "Email: ${users[index].email}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Consumer<DataProvider>(
                      builder: (context, value, child) {
                        List<Gate> office = value.filteredGates;
                        return Column(
                          children: [
                            TextField(
                              controller: _gateController,
                              onChanged: (v) {
                                setState(() {
                                  value.searchString = v;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'Search Gate',
                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GridView.builder(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent:
                                        MediaQuery.of(context).size.height *
                                            0.25,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                  ),
                                  itemCount: office.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, "/gate_list",
                                            arguments: office[index].gateID);
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    office[index].img!),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                office[index].gateName,
                                                style: TextStyle(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                physics: BouncingScrollPhysics(),
                unselectedLabelColor: Colors.grey.withOpacity(0.6),
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    height: 55,
                    child: Text(
                      "Users List",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Tab(
                    height: 55,
                    child: Text(
                      "Office's List",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
