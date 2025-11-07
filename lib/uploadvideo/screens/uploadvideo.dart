import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lecturenotesapp/common/widgets/custombutton.dart';
import 'package:lecturenotesapp/constants/colors.dart';
import 'package:lecturenotesapp/constants/utils.dart';
import 'package:lecturenotesapp/mypdfs/screens/mypdfs.dart';
import 'package:lecturenotesapp/uploadvideo/services/uploadservices.dart';

class Uploadvideo extends StatefulWidget {
  const Uploadvideo({super.key});

  @override
  State<Uploadvideo> createState() => _UploadvideoState();
}

class _UploadvideoState extends State<Uploadvideo> {
  File? _selectedVideo;
  bool _isUploading = false;
  Uploadservices uploadservices = Uploadservices();

  void handleVideoPick() async {
    final picked = await pickVideoFile();
    if (picked != null) {
      setState(() {
        _selectedVideo = picked;
      });
    }
  }

  void handleUpload() async {
    if (_selectedVideo == null) return;
    setState(() {
      _isUploading = true;
    });

    await uploadservices.uploadVideoFile("lecture", context, _selectedVideo!);

    setState(() {
      _isUploading = false;
    });

    Navigator.push(context, MaterialPageRoute(builder: (context) => Mypdfs()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 250,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: handleVideoPick,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Gcolors.primaryColor, shape: BoxShape.circle),
                      child: Icon(
                        Icons.upload,
                        size: 30,
                        color: Gcolors.secondaryColor,
                      ),
                    ),
                  ),
                  Text(
                    _selectedVideo != null
                        ? _selectedVideo!.path.split("/").last
                        : "Tap to upload video",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  if (_isUploading) ...[CircularProgressIndicator()],
                  if (!_isUploading && _selectedVideo != null) ...[
                    Custombutton(
                        buttontext: "Upload Video",
                        onTap: () {
                          handleUpload();
                        })
                  ]
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
