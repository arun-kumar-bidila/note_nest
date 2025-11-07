import 'package:flutter/material.dart';
import 'package:lecturenotesapp/constants/colors.dart';

class Howtouse extends StatelessWidget {
  const Howtouse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
          children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "How to Use",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    
                  ],
                ),
                SizedBox(height: 20,),
                for (int i = 0; i < 3;i++)
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.all(10),
                    height: 80,
                    decoration: BoxDecoration(
                        color: Gcolors.lightGrayBackground,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Gcolors.secondaryColor,
                              shape: BoxShape.circle,
                              ),
                          child: Text(
                            (i+1).toString(),style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),
                          )
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
                                "Upload your lecture video",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                "Select or drag & drop your video file",
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
                          Icons.arrow_forward_ios_sharp,
                          size: 30,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  )
          ],
                ),
        )),
    );
  }
}