import 'package:lecturenotesapp/models/userModel.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(id: "", email: "", password: "", token: "", pdfs: []);

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void addPdf(String pdfUrl) {
    final updatedPdfs = List<String>.from(_user.pdfs)..add(pdfUrl);
    _user = User(
        id: _user.id,
        email: _user.email,
        password: _user.password,
        token: _user.token,
        pdfs: updatedPdfs);
    notifyListeners();
  }
}
