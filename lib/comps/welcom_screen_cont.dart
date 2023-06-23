import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Welcome_cont extends StatelessWidget {
  String text;
  Function()? onTap;
  Welcome_cont({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(6, 7),
              spreadRadius: -7,
              blurRadius: 12,
              color: Color.fromRGBO(0, 0, 0, 1),
            )
          ],
          gradient: LinearGradient(
            colors: [Color(0xffff9800), Color.fromARGB(255, 255, 116, 108)],
            stops: [0, 1],
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
