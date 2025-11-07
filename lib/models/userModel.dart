import 'dart:convert';

class User {
  final String id;
  final String email;
  final String password;
  final String token;
  final List<String> pdfs;

  User(
      {required this.id,
      required this.email,
      required this.password,
      required this.token,
      required this.pdfs});

  Map<String, dynamic> toMap() {
    return {"id": id, "email": email, "password": password, "token": token,"pdfs":pdfs};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map["_id"] ?? '',
        email: map["email"] ?? '',
        password: map["password"] ?? '',
        token: map["token"] ?? '',
        pdfs: List<String>.from(map["pdfs"]??[]));
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) {
    return User.fromMap(json.decode(source));
  }
}
