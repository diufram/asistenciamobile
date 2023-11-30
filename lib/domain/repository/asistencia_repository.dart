import 'package:asistencia_vehicular/domain/models/servicioToTaller_model.dart';
import 'package:asistencia_vehicular/domain/request/asistencia_request.dart';

import '../models/asistencia_model.dart';
import '../models/servicio_model.dart';

abstract class AsistenciaRepositoryInterface {
  Future<List<Asistencia>> getAsistencias(String token);
  Future<List<Asistencia>> getAllAsistencias(String token);
  Future<void> addAsistencia(AsistenciaRequest asistencia, String token);
  Future<List<Servicio>> getAllServicios(String token);
  Future<List<ServicioToTaller>> getServicioToTaller(
      String servicioId, String token);
  Future<void> cancelarAsistencia(int i, String token);
  Future<void> asignarTecnico(
      String tecnicoid, String asistenciaid, String token);
  Future<void> cobrar(String total, String asistenciaid, String token);
}
