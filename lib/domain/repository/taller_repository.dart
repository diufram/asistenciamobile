import 'package:asistencia_vehicular/domain/models/get_servicioToTaller_model.dart';
import 'package:asistencia_vehicular/domain/models/tecnicos_model.dart';
import 'package:asistencia_vehicular/domain/request/servicio_request.dart';

import '../models/servicio_model.dart';
import '../models/taller_model.dart';
import '../models/tecnico_model.dart';

abstract class TallerRepositoryInterface {
  Future<List<Taller>> getTaller(String token);
  Future<List<Servicio>> getServicio(String token);
  Future<List<ServicioToTallers>> getServicioToTaller(String token);
  Future<void> addServicioToTaller(ServicioRequest servicio, String token);
  Future<List<Tecnicos>> getTecnicos();
  Future<void> addTecnicoToTaller(int tecnicoId, String token);
  Future<List<Tecnico>> getTecnicoToTaller(String token);
}
