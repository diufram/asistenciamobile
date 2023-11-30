import 'package:asistencia_vehicular/domain/models/servicio_model.dart';

import '../../domain/exeption/asistencia_exeption.dart';
import '../../domain/repository/servicio_repository.dart';
import '../../services/globals.dart';
import 'package:http/http.dart' as http;

class ServicioRepositotyImpl extends ServicioRepositoryInterface {
  @override
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
}
