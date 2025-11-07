import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lecturenotesapp/constants/utils.dart';
import 'package:lecturenotesapp/providers/userprovider.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class Downloadservices {
  Future<void> downloadPdf(
      String Url, Function(bool) onLoading, BuildContext context) async {
    try {
      
      var status = await Permission.storage.request();
      if (!status.isGranted) {
        var manageStatus = await Permission.manageExternalStorage.request();
        if (!manageStatus.isGranted) {
          showSnackbar(context, "Storage Permission denied");
          return;
        }
      }
      onLoading(true);

      // final dir = await getApplicationDocumentsDirectory();
      final dir = Directory('/storage/emulated/0/Download');
      //  final dir = await getExternalStorageDirectory();

      final fileName = Url.split("/").last;
      final filePath = "${dir.path}/${fileName}";
    final dio = Dio();
    final response = await dio.download(
      Url,
      filePath,
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: true,
        validateStatus: (status) => status != null && status < 500,
      ),
    );

  if (response.statusCode == 200) {
      print("✅ File downloaded to $filePath");
      
      // Check if file is valid
      final file = File(filePath);
      if (await file.exists() && await file.length() > 0) {
        await OpenFile.open(filePath);
      } else {
        throw Exception("File download failed or file is empty.");
      }
    } else {
      throw Exception("Failed to download file, status code: ${response.statusCode}");
    }
     
    } catch (e) {
      showSnackbar(context, e.toString());
    } finally {
      onLoading(false);
    }
  }
}
