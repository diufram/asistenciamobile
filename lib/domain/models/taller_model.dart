import 'dart:convert';

List<Taller> tallerFromJson(String str) =>
    List<Taller>.from(json.decode(str).map((x) => Taller.fromJson(x)));

String tallerToJson(List<Taller> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Taller {
  int id;
  String nombre;
  String ubicacion;
  int telefono;
  int propietarioId;

  Taller({
    required this.id,
    required this.nombre,
    required this.ubicacion,
    required this.telefono,
    required this.propietarioId,
  });

  factory Taller.fromJson(Map<String, dynamic> json) => Taller(
        id: json["id"],
        nombre: json["nombre"],
        ubicacion: json["ubicacion"],
        telefono: json["telefono"],
        propietarioId: json["propietario_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "ubicacion": ubicacion,
        "telefono": telefono,
        "propietario_id": propietarioId,
      };
}
