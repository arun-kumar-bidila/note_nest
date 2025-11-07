import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lecturenotesapp/auth/screens/login.dart';
import 'package:lecturenotesapp/auth/screens/signup.dart';
import 'package:lecturenotesapp/auth/widgets/openingscreenfeature.dart';
import 'package:lecturenotesapp/common/widgets/custombutton.dart';
import 'package:lecturenotesapp/constants/colors.dart';

class Openingscreen extends StatelessWidget {
  const Openingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 10),
        child: Column(
          spacing: 40,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Gcolors.primaryColor,
                  ),
                  child: Icon(
                    Icons.description,
                    size: 50,
                    color: Gcolors.secondaryColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "Transform Lectures into Smart Notes",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "Generate smart PDF notes from your lecture videos",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                    softWrap: true,
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: [
                Openingscreenfeature(
                    icon: Icons.play_circle_fill,
                    title: "Video to PDF Conversion",
                    subtitle: "Convert any lecture video into organized notes"),
                Openingscreenfeature(
                    icon: Icons.edit_note_rounded,
                    title: "Smart Note Organization",
                    subtitle: "AI-powered content structuring"),
                Openingscreenfeature(
                    icon: Icons.ios_share_rounded,
                    title: "Easy Sharing",
                    subtitle: "Share your notes instantly with peers")
              ],
            ),
            Custombutton(
              buttontext: "Get Started",
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Signup()));
              },
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Already have an account?  ",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black)),
              TextSpan(
                  text: "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Gcolors.secondaryColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    }),
            ]))
          ],
        ),
      )),
    );
  }
}
