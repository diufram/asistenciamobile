import 'dart:convert';

import 'package:asistencia_vehicular/domain/models/user_model.dart';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  User user;
  String accessToken;
  String tokenType;

  Login({
    required this.user,
    required this.accessToken,
    required this.tokenType,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        user: User.fromJson(json["user"]),
        accessToken: json["access_token"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "access_token": accessToken,
        "token_type": tokenType,
      };
}
