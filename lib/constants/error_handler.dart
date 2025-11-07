import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lecturenotesapp/constants/utils.dart';

void httpErrorHandler({
  required BuildContext context,
  required http.Response response,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackbar(context, jsonDecode(response.body)["msg"]);
      break;
    case 500:
      showSnackbar(context, jsonDecode(response.body)["error"]);
      break;
    default:
      showSnackbar(context, response.body);
  }
}
