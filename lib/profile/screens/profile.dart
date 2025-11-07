import 'package:flutter/material.dart';
import 'package:lecturenotesapp/auth/services/authservice.dart';
import 'package:lecturenotesapp/common/widgets/custombutton.dart';
import 'package:lecturenotesapp/constants/colors.dart';
import 'package:lecturenotesapp/providers/userprovider.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Authservice authservice = Authservice();

  void logOutUser() {
    authservice.logOutUser(context);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    "assets/dp.jpg",
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.email,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "${user.email}@gmail.com",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color:Gcolors.lightGrayBackground,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(1, 1))
          ]
                

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15,
                children: [
                  Text("Storage Used",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      width: double.infinity,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.grey
                      ),
                      child: Stack(
                        children: [
                          FractionallySizedBox(
                            widthFactor: 5/10,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Gcolors.secondaryColor,
                                borderRadius: BorderRadius.circular(5)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Text("3.2 GB of 5 GB used",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w100),),

                ],
              ),
            ),

            Custombutton(buttontext: "Log Out", onTap: logOutUser)
          ],
        ),
      )),
    );
  }
}
