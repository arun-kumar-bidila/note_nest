import 'package:flutter/material.dart';
import 'package:lecturenotesapp/constants/colors.dart';
import 'package:lecturenotesapp/home/widgets/homefeature.dart';
import 'package:lecturenotesapp/howtouse/screens/howtouser.dart';
import 'package:lecturenotesapp/mypdfs/screens/mypdfs.dart';
import 'package:lecturenotesapp/profile/screens/profile.dart';
import 'package:lecturenotesapp/providers/userprovider.dart';
import 'package:lecturenotesapp/uploadvideo/screens/uploadvideo.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello ${user.email}",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 20,
            children: [
              Row(
                spacing: 10,
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Uploadvideo()));
                    },
                    child: Homefeature(
                      icon: Icons.ios_share_outlined,
                      label: "Upload Video",
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Mypdfs()));
                    },
                    child: Homefeature(
                      icon: Icons.description,
                      label: "My PDFs",
                    ),
                  ))
                ],
              ),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Howtouse()));
                    },
                    child: Homefeature(
                      icon: Icons.question_mark_rounded,
                      label: "How to Use",
                    ),
                  )),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Profile()));
                      },
                      child: Homefeature(
                        icon: Icons.settings,
                        label: "Settings",
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent PDFs",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Gcolors.secondaryColor,
                    ),
                  ),
                ],
              ),
              for (var pdfUrl in user.pdfs)
                Container(
                  padding: EdgeInsets.all(10),
                  height: 80,
                  decoration: BoxDecoration(
                      color: Gcolors.lightGrayBackground,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Gcolors.primaryColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          Icons.description,
                          color: Gcolors.secondaryColor,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              pdfUrl.split("/").last,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "Today • 4 MB",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.download,
                        size: 30,
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
