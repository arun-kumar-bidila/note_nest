import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lecturenotesapp/auth/screens/login.dart';
import 'package:lecturenotesapp/common/widgets/bottombar.dart';
import 'package:lecturenotesapp/constants/error_handler.dart';
import 'package:lecturenotesapp/constants/utils.dart';
import 'package:lecturenotesapp/home/screens/homescreen.dart';
import 'package:lecturenotesapp/models/userModel.dart';

import 'package:http/http.dart' as http;
import 'package:lecturenotesapp/constants/variables.dart';
import 'package:lecturenotesapp/providers/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authservice {
  void signupUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      User user = User(id: "", email: email, password: password, token: "",pdfs: []);

      http.Response res = await http.post(Uri.parse("$uri/api/signup"),
          body: user.toJson(),
          headers: <String, String>{
            "Content-type": "application/json;charset=UTF-8",
          });
      print("\nresponse\n");
      httpErrorHandler(
          context: context,
          response: res,
          onSuccess: () {
            showSnackbar(
                context, "Account created successfully login with credentials");
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Login()));
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  void signinUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      http.Response res = await http.post(Uri.parse("$uri/api/signin"),
          body: jsonEncode({"email": email, "password": password}),
          headers: <String, String>{
            "Content-type": "application/json;charset=UTF-8"
          });
      print("response called");
      httpErrorHandler(
          context: context,
          response: res,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await prefs.setString(
                "x-auth-token", jsonDecode(res.body)["token"]);

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Bottombar()));
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  void getUserData(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("x-auth-token");
      print(token);

      if (token == null) {
        prefs.setString("x-auth-token", "");
      }
      http.Response tokenRes = await http.post(Uri.parse("$uri/tokenIsValid"),
          headers: <String, String>{
            "Content-type": "application/json;charset=UTF-8",
            "x-auth-token": token!
          });

      var response = jsonDecode(tokenRes.body);
      print("\ntokenres created\n");
      print(response);
      if (response == true) {
        http.Response userRes = await http.get(Uri.parse("$uri/"),
            headers: <String, String>{
              "Content-type": "application/json;charset=UTF-8",
              "x-auth-token": token
            });
        print("\nuserres created\n");
        Provider.of<UserProvider>(context, listen: false).setUser(userRes.body);
        print(userRes.body);
        print("\nres\n");
      }
    } catch (e) {}
  }

  void logOutUser(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      showSnackbar(context, "Log out successful");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Login()),
        (route) => false, // remove all previous routes
      );
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
