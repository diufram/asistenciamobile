import 'dart:io';

class VehiculoRequest {
  VehiculoRequest(this.anho, this.modelo, this.image, this.marca);
  String marca;
  String anho;
  String modelo;
  File? image;
}
