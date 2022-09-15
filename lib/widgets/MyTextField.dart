import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {


  TextEditingController oncontroller;
  MyTextField({this.oncontroller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        decoration:
        BoxDecoration(border: Border.all(color: Colors.black)),
        child: TextField(
          controller: oncontroller,
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}
