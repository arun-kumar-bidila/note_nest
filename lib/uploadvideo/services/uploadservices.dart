import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lecturenotesapp/constants/utils.dart';
import 'package:lecturenotesapp/constants/variables.dart';
import 'package:lecturenotesapp/providers/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Uploadservices {
  Future<void> uploadVideoFile(
      String pdfName, BuildContext context, File file) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = userProvider.user;
    try {
      var request = http.MultipartRequest("POST", Uri.parse("$uri/summarize"));
      request.files.add(await http.MultipartFile.fromPath("video", file.path));
      request.fields["pdfName"] = pdfName;
      request.headers["x-auth-token"] = user.token;

      var streamedRes = await request.send();

      var res = await http.Response.fromStream(streamedRes);

      final resBody = jsonDecode(res.body);
      print(resBody);

      if (res.statusCode == 200 && resBody["success"] == true) {
        final newPdfUrl = resBody["pdfURL"];
        print(newPdfUrl);

        userProvider.addPdf(newPdfUrl);
        showSnackbar(context, "Uploaded successfully");
      } else {
        showSnackbar(context, "Error in uploading");
      }
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
