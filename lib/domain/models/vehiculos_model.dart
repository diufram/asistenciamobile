import 'dart:convert';

List<Vehiculo> vehiculoFromJson(String str) =>
    List<Vehiculo>.from(json.decode(str).map((x) => Vehiculo.fromJson(x)));

String vehiculoToJson(List<Vehiculo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Vehiculo {
  int id;
  String marca;
  String anho;
  String modelo;
  String path;
  int clienteId;

  Vehiculo({
    required this.id,
    required this.marca,
    required this.anho,
    required this.modelo,
    required this.path,
    required this.clienteId,
  });

  factory Vehiculo.fromJson(Map<String, dynamic> json) => Vehiculo(
        id: json["id"],
        marca: json["marca"],
        anho: json["anho"],
        modelo: json["modelo"],
        path: json["path"],
        clienteId: json["cliente_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "marca": marca,
        "anho": anho,
        "modelo": modelo,
        "path": path,
        "cliente_id": clienteId,
      };
}
