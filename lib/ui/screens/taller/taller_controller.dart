import 'package:asistencia_vehicular/domain/models/get_servicioToTaller_model.dart';
import 'package:asistencia_vehicular/domain/models/servicio_model.dart';
import 'package:asistencia_vehicular/domain/repository/taller_repository.dart';
import 'package:asistencia_vehicular/domain/request/servicio_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../domain/exeption/auth_exeption.dart';
import '../../../domain/repository/local_storage_repository.dart';

class TallerController extends GetxController {
  final TallerRepositoryInterface tallerRepositoryInterface;
  final LocalRepositoryInterface localRepositoryInterface;
  TallerController(
      this.tallerRepositoryInterface, this.localRepositoryInterface);

  List<Servicio> servicios = [];

  List<ServicioToTallers> serviciosToTaller = [];



  bool isLoading = true;

  String? selectServicio;
  var s = "".obs;


  @override
  void onReady() {
    getServicioToTallers();
    getServicios();
    super.onReady();
  }

  final precioTextController = TextEditingController();

  Future<void> getServicios() async {
    final token = await localRepositoryInterface.getToken();
    try {
      final servicio = await tallerRepositoryInterface.getServicio(token);
      servicios = servicio;
      update();
    } catch (_) {
      throw AuthException();
    }
  }

  Future<void> getServicioToTallers() async {
    final token = await localRepositoryInterface.getToken();
    try {
      final servicio =
          await tallerRepositoryInterface.getServicioToTaller(token);
      serviciosToTaller = servicio;
      isLoading = false;
      update();
    } catch (_) {
      throw AuthException();
    }
  }

  int getServ() {
    for (var i = 0; i < servicios.length; i++) {
      if (selectServicio == servicios[i].nombre) return servicios[i].id;
    }
    return 0;
  }

  Future<bool> addServicioToTaller() async {
    final token = await localRepositoryInterface.getToken();
    try {
      print(getServ());
      final serv = ServicioRequest(
          id: getServ().toString(), precioBase: precioTextController.text);
      await tallerRepositoryInterface.addServicioToTaller(serv, token);
      update();
      return true;
    } on AuthException catch (_) {
      return false;
    }
  }
}
