import 'package:flutter/material.dart';
import 'package:lecturenotesapp/constants/colors.dart';

class Openingscreenfeature extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const Openingscreenfeature(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Gcolors.primaryColor,
          ),
          child: Icon(
            icon,
            size: 30,
            color: Gcolors.secondaryColor,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
                softWrap: true,
              ),
              SizedBox(height: 5,),
              Text(
                subtitle,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w200),
                softWrap: true,
              )
            ],
          ),
        )
      ],
    );
  }
}
