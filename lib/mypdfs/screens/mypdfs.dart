import 'package:flutter/material.dart';
import 'package:lecturenotesapp/constants/colors.dart';
import 'package:lecturenotesapp/constants/utils.dart';
import 'package:lecturenotesapp/mypdfs/services/downloadservices.dart';
import 'package:lecturenotesapp/providers/userprovider.dart';
import 'package:provider/provider.dart';

class Mypdfs extends StatefulWidget {
  const Mypdfs({super.key});

  @override
  State<Mypdfs> createState() => _MypdfsState();
}

class _MypdfsState extends State<Mypdfs> {
  String? _downloadPdfUrl;
  Downloadservices downloadservices = Downloadservices();

  void _handleDownloadPdf(String pdfUrl) async {
    try {
      await downloadservices.downloadPdf(pdfUrl, (isLoading) {
        if (!isLoading) {
          setState(() {
            _downloadPdfUrl = null;
          });
        }
      }, context);
    } catch (e) {
      showSnackbar(context, e.toString());
      setState(() {
        _downloadPdfUrl = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView
          (
            child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
            spacing: 20,
            children: [
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
                      _downloadPdfUrl == pdfUrl
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Gcolors.secondaryColor,
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                _handleDownloadPdf(pdfUrl);
                              },
                              child: Icon(
                                Icons.download,
                                size: 30,
                                color: Colors.grey,
                              ),
                            )
                    ],
                  ),
                )
            ],
                    ),
                  ),
          )),
    );
  }
}
