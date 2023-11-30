import 'package:asistencia_vehicular/domain/exeption/vehiculo_exeption.dart';
import 'package:asistencia_vehicular/domain/repository/vehiculo_repository.dart';
import 'package:asistencia_vehicular/domain/request/vehiculo_request.dart';
import '../../domain/models/vehiculos_model.dart';
import '../../services/globals.dart';
import 'package:http/http.dart' as http;

class VehiculoRepositoryImpl extends VehiculoRepositoryInterface {
  @override
  Future<List<Vehiculo>> getVehiculos(String token) async {
    Map<String, String> header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    var url = Uri.parse(baseURL + 'vehiculos');

    final response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      final vehiculos = vehiculoFromJson(response.body);
      return vehiculos;
    }
    throw VehiculoException();
  }

  @override
  Future<void> addVehiculo(
      VehiculoRequest vehiculo, String token, String img) async {
    Map<String, String> header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    var url = Uri.parse(baseURL + 'vehiculos/create');
    final request = http.MultipartRequest('POST', url);

    request.fields['marca'] = vehiculo.marca;
    request.fields['anho'] = vehiculo.anho;
    request.fields['modelo'] = vehiculo.modelo;
    request.headers.addAll(header);

    if (vehiculo.image != null) {
      request.files.add(
          await http.MultipartFile.fromPath('photos', vehiculo.image!.path));
    }
    await http.Response.fromStream(await request.send());
  }

  @override
  Future<void> deleteVehiculo(VehiculoRequest vehiculo, String token) {
    // TODO: implement deleteVehiculo
    throw UnimplementedError();
  }
}
