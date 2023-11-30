import 'package:asistencia_vehicular/domain/models/servicio_model.dart';

abstract class ServicioRepositoryInterface {
  Future<List<Servicio>> getAllServicios(String token);
}
