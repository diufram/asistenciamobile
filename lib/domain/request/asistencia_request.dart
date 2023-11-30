import 'dart:io';

class AsistenciaRequest {
  final String descripcion;
  final double latitud;
  final double longitud;
  final File? image;
  final String tallerId;
  final String servicioId;
  AsistenciaRequest(
      {required this.descripcion,
      required this.latitud,
      required this.longitud,
      required this.image,
      required this.tallerId,
      required this.servicioId});
}
