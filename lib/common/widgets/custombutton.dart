import 'package:flutter/material.dart';
import 'package:lecturenotesapp/constants/colors.dart';

class Custombutton extends StatelessWidget {
  final String buttontext;
  final VoidCallback onTap;
  const Custombutton({super.key, required this.buttontext,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          onPressed:onTap,
          style: ElevatedButton.styleFrom(
              backgroundColor: Gcolors.secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: Text(
            buttontext,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          )),
    );
  }
}
