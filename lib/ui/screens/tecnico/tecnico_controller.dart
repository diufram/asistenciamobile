import 'package:asistencia_vehicular/domain/models/tecnico_model.dart';
import 'package:asistencia_vehicular/domain/models/tecnicos_model.dart';
import 'package:asistencia_vehicular/domain/repository/taller_repository.dart';
import 'package:get/get.dart';

import '../../../domain/exeption/auth_exeption.dart';
import '../../../domain/repository/local_storage_repository.dart';

class TecnicoController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;

  final TallerRepositoryInterface tallerRepositoryInterface;

  TecnicoController(
      this.localRepositoryInterface, this.tallerRepositoryInterface);
  @override
  void onReady() {
    getTecnicosToTaller();
    getTecnicos();
    super.onReady();
  }


  String? sTecnico;
  var t = "".obs;

  bool isLoading = true;
  List<Tecnicos> tecnicos = [];

  List<Tecnico> tecnico = [];

  String? selectedTecnico;
  var st = "".obs;

  Future<bool> addTecnico() async {
    try {
      final token = await localRepositoryInterface.getToken();
      await tallerRepositoryInterface.addTecnicoToTaller(
          int.parse(st.value), token);
      return true;
    } on AuthException catch (_) {
      return false;
    }
  }

  Future<void> getTecnicos() async {
    try {
      final tecnico = await tallerRepositoryInterface.getTecnicos();
      tecnicos = tecnico;
      update();
    } catch (_) {
      AuthException();
    }
  }

  Future<void> getTecnicosToTaller() async {
    try {
      final token = await localRepositoryInterface.getToken();
      final t = await tallerRepositoryInterface.getTecnicoToTaller(token);
      tecnico = t;
      isLoading = false;
      update();
    } catch (_) {
      AuthException();
    }
  }
}
