import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  final String hinttext;
  final TextEditingController controller;
  const Customtextfield({super.key, required this.hinttext,required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey, width: 1))),
      ),
    );
  }
}
