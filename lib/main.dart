import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lecturenotesapp/auth/screens/openingscreen.dart';
import 'package:lecturenotesapp/auth/screens/signup.dart';
import 'package:lecturenotesapp/auth/services/authservice.dart';
import 'package:lecturenotesapp/common/widgets/bottombar.dart';
import 'package:lecturenotesapp/constants/colors.dart';
import 'package:lecturenotesapp/home/screens/homescreen.dart';
import 'package:lecturenotesapp/providers/userprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Authservice authservice = Authservice();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init state called");
    authservice.getUserData(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Gcolors.scaffoldColor,
          appBarTheme: AppBarTheme(backgroundColor: Gcolors.secondaryColor),
          useMaterial3: true,
          textTheme: GoogleFonts.interTextTheme()),
      debugShowCheckedModeBanner: false,
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Bottombar()
          : Openingscreen(),
    );
  }
}
