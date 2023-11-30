import 'dart:convert';

List<Asistencia> asistenciaFromJson(String str) =>
    List<Asistencia>.from(json.decode(str).map((x) => Asistencia.fromJson(x)));

String asistenciaToJson(List<Asistencia> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Asistencia {
  int id;
  String descripcion;
  String latitud;
  String longitud;
  String url;
  int? tallerId;
  int clienteId;
  dynamic cobroId;
  int? tecnicoId;
  int? servicioId;
  bool? sw;
  String? total;
  String? nombre;
  String? clienteNombre;
  String? tallerNombre;

  Asistencia(
      {required this.id,
      required this.descripcion,
      required this.latitud,
      required this.longitud,
      required this.url,
      required this.tallerId,
      required this.clienteId,
      required this.cobroId,
      required this.tecnicoId,
      required this.servicioId,
      required this.sw,
      required this.total,
      required this.nombre,
      required this.clienteNombre,
      required this.tallerNombre});

  factory Asistencia.fromJson(Map<String, dynamic> json) => Asistencia(
      id: json["id"],
      descripcion: json["descripcion"],
      latitud: json["latitud"],
      longitud: json["longitud"],
      url: json["url"],
      tallerId: json["taller_id"],
      clienteId: json["cliente_id"],
      cobroId: json["cobro_id"],
      tecnicoId: json["tecnico_id"],
      servicioId: json["servicio_id"],
      sw: json["sw"],
      total: json["total"],
      nombre: json["nombre"],
      clienteNombre: json["cliente_name"],
      tallerNombre: json["taller_nombre"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "latitud": latitud,
        "longitud": longitud,
        "url": url,
        "taller_id": tallerId,
        "cliente_id": clienteId,
        "cobro_id": cobroId,
        "tecnico_id": tecnicoId,
        "servicio_id": servicioId,
        "sw": sw,
        "total": total,
        "nombre": nombre,
      };
}
