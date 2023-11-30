import 'dart:convert';

import 'package:asistencia_vehicular/domain/models/user_model.dart';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  User user;
  String accessToken;
  String tokenType;

  Register({
    required this.user,
    required this.accessToken,
    required this.tokenType,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
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
