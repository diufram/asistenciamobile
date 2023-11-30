import 'package:asistencia_vehicular/domain/exeption/taller_exeption.dart';
import 'package:asistencia_vehicular/domain/models/get_servicioToTaller_model.dart';
import 'package:asistencia_vehicular/domain/models/servicio_model.dart';
import 'package:asistencia_vehicular/domain/models/taller_model.dart';
import 'package:asistencia_vehicular/domain/models/tecnicos_model.dart';
import 'package:asistencia_vehicular/domain/repository/taller_repository.dart';
import 'package:asistencia_vehicular/domain/request/servicio_request.dart';
import '../../domain/models/tecnico_model.dart';
import '../../services/globals.dart';
import 'package:http/http.dart' as http;

class TallerRepositoryImpl extends TallerRepositoryInterface {
  @override
  Future<List<Taller>> getTaller(String token) async {
    Map<String, String> header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    var url = Uri.parse(baseURL + 'tallers');

    final response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      final tallers = tallerFromJson(response.body);
      return tallers;
    }
    throw TallerException();
  }

  @override
  Future<List<Servicio>> getServicio(String token) async {
    Map<String, String> header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    var url = Uri.parse(baseURL + 'servicio');

    final response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      final servicios = servicioFromJson(response.body);
      return servicios;
    }
    throw TallerException();
  }

  @override
  Future<List<ServicioToTallers>> getServicioToTaller(String token) async {
    Map<String, String> header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    var url = Uri.parse(baseURL + 'getServicioToTaller');

    final response = await http.get(url, headers: header);
    final servicios = servicioToTallersFromJson(response.body);
    return servicios;
  }

  @override
  Future<void> addServicioToTaller(
      ServicioRequest servicio, String token) async {
    Map<String, String> header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    print(servicio.id);

    Map data = {
      "servicio_id": servicio.id,
      "precioBase": servicio.precioBase,
    };
    var url = Uri.parse(baseURL + 'addServicioToTaller');

    await http.post(url, body: data, headers: header);
  }

  @override
  Future<List<Tecnicos>> getTecnicos() async {
    var url = Uri.parse(baseURL + 'tecnicos');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final tecnicos = tecnicosFromJson(response.body);
      return tecnicos;
    }
    throw TallerException();
  }

  @override
  Future<void> addTecnicoToTaller(int tecnicoId, String token) async {
    Map<String, String> header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    Map data = {
      "tecnico_id": tecnicoId.toString(),
    };
    var url = Uri.parse(baseURL + 'addtecnico');

    await http.post(url, body: data, headers: header);
  }

  @override
  Future<List<Tecnico>> getTecnicoToTaller(String token) async {
    Map<String, String> header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    var url = Uri.parse(baseURL + 'tecnicoToTaller');

    final response = await http.get(url, headers: header);
    final tecnicos = tecnicoFromJson(response.body);
    return tecnicos;
  }
}
