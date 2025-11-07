import 'package:flutter/material.dart';
import 'package:lecturenotesapp/constants/colors.dart';
import 'package:lecturenotesapp/home/screens/homescreen.dart';
import 'package:lecturenotesapp/mypdfs/screens/mypdfs.dart';
import 'package:lecturenotesapp/profile/screens/profile.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  List<Widget> pages = [
    Homescreen(),
    Center(child: Text("Global Pdfs")),
    Mypdfs(),
    Profile()
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Gcolors.lightGrayBackground,
          selectedItemColor: Gcolors.secondaryColor,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.ios_share,
                ),
                label: "Upload"),
            BottomNavigationBarItem(
                icon: Icon(Icons.description), label: "My PDFs"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
    );
  }
}
