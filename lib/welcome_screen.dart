import 'package:netsmartz/models/gate_model.dart';
import 'package:flutter/material.dart';
import 'comps/welcom_screen_cont.dart';
import 'provider/data.dart';
import 'package:provider/provider.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .25,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
            ),
            Consumer<DataProvider>(
              builder: (context, data, child) {
                List<Gate> office = data.gates;
                return Container(
                  height: MediaQuery.of(context).size.height * .4,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      PageView.builder(
                        physics: BouncingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (value) {
                          data.activePage = value;
                        },
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          if (office.isNotEmpty) {
                            return Stack(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * .4,
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.asset(office[index].img!,
                                      fit: BoxFit.cover),
                                ),
                              ],
                            );
                          }
                          return CircularProgressIndicator();
                        },
                      ),
                      Positioned(
                          left: MediaQuery.of(context).size.width * 0.5 - 35,
                          top: MediaQuery.of(context).size.height * 0.35,
                          child: Row(
                              children: List.generate(4, (index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: GestureDetector(
                                onTap: () {
                                  _pageController.animateToPage(
                                    index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  );
                                },
                                child: CircleAvatar(
                                  backgroundColor: data.activePage == index
                                      ? Colors.black
                                      : Color.fromARGB(255, 217, 217, 217),
                                  radius: 6,
                                ),
                              ),
                            );
                          }))),
                    ],
                  ),
                );
              },
            ),
            Container(
              height: MediaQuery.of(context).size.height * .35,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Welcome_cont(
                            text: "USER",
                            onTap: () {
                              //User Page Route
                              Navigator.pop(context);
                            },
                          ),
                          Welcome_cont(
                            text: "ADMIN",
                            onTap: () {
                              //Admin Page Route
                              Navigator.pushNamed(context, "/login");
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Founded in 1999, Netsmartz is a USA-based software",
                      style: TextStyle(fontSize: 14.5),
                    ),
                    Text(
                      "comapny.",
                      style: TextStyle(fontSize: 14.5),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
