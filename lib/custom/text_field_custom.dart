import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldCustom extends StatelessWidget {
  String label;
  double height;
  double width;
  TextEditingController controller;
  String? intialvalue;

  TextFieldCustom({
    super.key,
    required this.label,
    required this.controller,
    required this.height,
    required this.width,
    this.intialvalue,
  });

  @override
  Widget build(BuildContext context) {
    controller.text = intialvalue ?? '';

    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        style: const TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
          label: Text(label),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
