import 'package:flutter/material.dart';
import 'package:lecturenotesapp/constants/colors.dart';

class Homefeature extends StatelessWidget {
  final IconData icon;
  final String label;
  const Homefeature({super.key, required this.icon,required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Gcolors.lightGrayBackground,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(1, 1))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Gcolors.primaryColor,
            ),
            child: Icon(
              icon,
              size: 30,
              color: Gcolors.secondaryColor,
            ),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
