import 'dart:convert';

List<ServicioToTaller> servicioToTallerFromJson(String str) =>
    List<ServicioToTaller>.from(
        json.decode(str).map((x) => ServicioToTaller.fromJson(x)));

String servicioToTallerToJson(List<ServicioToTaller> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServicioToTaller {
  String precio;
  int servicioId;
  int tallerId;
  String tallerNombre;
  String servicioNombre;

  ServicioToTaller({
    required this.precio,
    required this.servicioId,
    required this.tallerId,
    required this.tallerNombre,
    required this.servicioNombre,
  });

  factory ServicioToTaller.fromJson(Map<String, dynamic> json) =>
      ServicioToTaller(
        precio: json["precio"],
        servicioId: json["servicio_id"],
        tallerId: json["taller_id"],
        tallerNombre: json["taller_nombre"],
        servicioNombre: json["servicio_nombre"],
      );

  Map<String, dynamic> toJson() => {
        "precio": precio,
        "servicio_id": servicioId,
        "taller_id": tallerId,
        "taller_nombre": tallerNombre,
        "servicio_nombre": servicioNombre,
      };
}
