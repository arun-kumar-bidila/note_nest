import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lecturenotesapp/auth/screens/signup.dart';
import 'package:lecturenotesapp/auth/services/authservice.dart';
import 'package:lecturenotesapp/common/widgets/custombutton.dart';
import 'package:lecturenotesapp/common/widgets/customtextfield.dart';
import 'package:lecturenotesapp/constants/colors.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Authservice authservice = Authservice();
  void signinUser() {
    print("\nsiginuser\n");
    authservice.signinUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 40,
          children: [
            Text(
              "Welcome Back",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Column(
              spacing: 30,
              children: [
                Customtextfield(
                  hinttext: "Email",
                  controller: _emailController,
                ),
                Customtextfield(
                  hinttext: "Password",
                  controller: _passwordController,
                ),
              ],
            ),
            Custombutton(
                buttontext: "Login",
                onTap: () {
                  signinUser();
                }),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Gcolors.scaffoldColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.email_outlined,
                        size: 30,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Continue with Google",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  )),
            ),
            Text(
              "Forgot your password?",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "Don't have a account?   ",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              TextSpan(
                  text: "Signup",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Gcolors.secondaryColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signup()));
                    }),
            ]))
          ],
        ),
      )),
    );
  }
}
