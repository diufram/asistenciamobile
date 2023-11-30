
import 'dart:convert';

List<Tecnicos> tecnicosFromJson(String str) => List<Tecnicos>.from(json.decode(str).map((x) => Tecnicos.fromJson(x)));

String tecnicosToJson(List<Tecnicos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tecnicos {
    int id;
    String name;
    String email;
    String password;
    String tipo;
    String telefono;
    dynamic rememberToken;
    DateTime createdAt;
    DateTime updatedAt;

    Tecnicos({
        required this.id,
        required this.name,
        required this.email,
        required this.password,
        required this.tipo,
        required this.telefono,
        required this.rememberToken,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Tecnicos.fromJson(Map<String, dynamic> json) => Tecnicos(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        tipo: json["tipo"],
        telefono: json["telefono"],
        rememberToken: json["remember_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "tipo": tipo,
        "telefono": telefono,
        "remember_token": rememberToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
