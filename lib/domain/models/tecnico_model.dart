import 'dart:convert';

List<Tecnico> tecnicoFromJson(String str) =>
    List<Tecnico>.from(json.decode(str).map((x) => Tecnico.fromJson(x)));

String tecnicoToJson(List<Tecnico> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tecnico {
  int id;
  String name;
  String telefono;

  Tecnico({
    required this.id,
    required this.name,
    required this.telefono,
  });

  factory Tecnico.fromJson(Map<String, dynamic> json) => Tecnico(
        id: json["id"],
        name: json["name"],
        telefono: json["telefono"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "telefono": telefono,
      };
}
