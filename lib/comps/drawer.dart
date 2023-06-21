import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              image: DecorationImage(
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Color.fromARGB(129, 0, 0, 0),
                  BlendMode.multiply,
                ),
                image: AssetImage("assets/images/chandigarh.jpg"),
              ),
            ),
            currentAccountPicture: CircleAvatar(
              foregroundImage: AssetImage("assets/images/download.jpeg"),
            ),
            accountName: Text("userNAME"),
            accountEmail: Text("userEMAIL"),
          ),
          ListTile(
            leading: Text("EMP ID"),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/employee_details");
            },
            child: ListTile(
              leading: Icon(Icons.person_add),
              title: Text("ADD USER"),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/gate_details");
            },
            child: ListTile(
              leading: Icon(Icons.add_home_work),
              title: Text("ADD OFFICE"),
            ),
          )
        ],
      ),
    );
  }
}
