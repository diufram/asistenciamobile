import 'package:asistencia_vehicular/domain/request/vehiculo_request.dart';

import '../models/vehiculos_model.dart';

abstract class VehiculoRepositoryInterface {
  Future<List<Vehiculo>> getVehiculos(String token);
  Future<void> addVehiculo(VehiculoRequest vehiculo, String token, String img);
  Future<void> deleteVehiculo(VehiculoRequest vehiculo, String token);
}
