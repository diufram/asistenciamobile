import 'package:asistencia_vehicular/domain/exeption/asistencia_exeption.dart';
import 'package:asistencia_vehicular/domain/models/asistencia_model.dart';
import 'package:asistencia_vehicular/domain/models/servicioToTaller_model.dart';
import 'package:asistencia_vehicular/domain/repository/asistencia_repository.dart';
import 'package:asistencia_vehicular/domain/request/asistencia_request.dart';
import 'package:http/http.dart' as http;
import '../../domain/models/servicio_model.dart';
import '../../services/globals.dart';

class AsistenciaRepositoryImpl extends AsistenciaRepositoryInterface {
  @override
  Future<void> addAsistencia(AsistenciaRequest asistencia, String token) async {
    Map<String, String> header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    var url = Uri.parse(baseURL + 'asistencia/create');
    final request = http.MultipartRequest('POST', url);

    request.fields['descripcion'] = asistencia.descripcion;
    request.fields['latitud'] = asistencia.latitud.toString();
    request.fields['longitud'] = asistencia.longitud.toString();
    request.fields['taller_id'] = asistencia.tallerId.toString();
    request.fields['servicio_id'] = asistencia.servicioId.toString();
    request.headers.addAll(header);

    if (asistencia.image != null) {
      request.files.add(
          await http.MultipartFile.fromPath('photos', asistencia.image!.path));
    }
    await http.Response.fromStream(await request.send());
  }

  @override
  Future<List<Asistencia>> getAsistencias(String token) async {
    Map<String, String> header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    var url = Uri.parse(baseURL + 'asistencia');

    final response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      final asistencias = asistenciaFromJson(response.body);
      return asistencias;
    }
    throw AsistenciaException();
  }

  @override
  Future<List<Asistencia>> getAllAsistencias(String token) async {
    Map<String, String> header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    var url = Uri.parse(baseURL + 'asistencias');

    final response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      final asistencias = asistenciaFromJson(response.body);
      return asistencias;
    }
    throw AsistenciaException();
  }

  Future<List<Servicio>> getAllServicios(String token) async {
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
    throw AsistenciaException();
  }

  @override
  Future<List<ServicioToTaller>> getServicioToTaller(
      String servicioId, String token) async {
    Map<String, String> header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    Map data = {
      "servicio_id": servicioId,
    };
    var url = Uri.parse(baseURL + 'servicioToTallers');

    final response = await http.post(url, body: data, headers: header);

    if (response.statusCode == 200) {
      final servicioToTaller = servicioToTallerFromJson(response.body);
      return servicioToTaller;
    }
    throw AsistenciaException();
  }

  @override
  Future<void> cancelarAsistencia(int i, String token) async {
    Map<String, String> header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    Map data = {
      "asistencia_id": i.toString(),
    };
    var url = Uri.parse(baseURL + 'cancelarAsistencia');

    await http.post(url, body: data, headers: header);
  }

  @override
  Future<void> asignarTecnico(
      String tecnicoid, String asistenciaid, String token) async {
    Map<String, String> header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    Map data = {
      "asistencia_id": asistenciaid,
      "tecnico_id": tecnicoid,
    };
    var url = Uri.parse(baseURL + 'addTecnicoToAsistencia');

    await http.post(url, body: data, headers: header);
  }

  @override
  Future<void> cobrar(String total, String asistenciaid, String token) async {
    Map<String, String> header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    Map data = {
      "total": double.parse(total).toString(),
      "asistencia_id": asistenciaid
    };
    var url = Uri.parse(baseURL + 'cobroasistencia');

    await http.post(url, body: data, headers: header);
  }
}
