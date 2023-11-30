import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String name;
  String email;
  String tipo;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.tipo});

  factory User.empty() =>
      User(id: int.parse("1"), name: "null", email: "null", tipo: "null");

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        tipo: json["tipo"],
      );

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "email": email, "tipo": tipo};
}
