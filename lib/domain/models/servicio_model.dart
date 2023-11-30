import 'dart:convert';

List<Servicio> servicioFromJson(String str) =>
    List<Servicio>.from(json.decode(str).map((x) => Servicio.fromJson(x)));

String servicioToJson(List<Servicio> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Servicio {
  int id;
  String nombre;
  String descripcion;

  Servicio({
    required this.id,
    required this.nombre,
    required this.descripcion,
  });

  factory Servicio.fromJson(Map<String, dynamic> json) => Servicio(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() =>
      {"id": id, "nombre": nombre, "descripcion": descripcion};
}
