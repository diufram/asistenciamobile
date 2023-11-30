import 'dart:convert';
import 'dart:io';

import 'package:asistencia_vehicular/domain/exeption/auth_exeption.dart';
import 'package:asistencia_vehicular/domain/models/user_model.dart';
import 'package:asistencia_vehicular/domain/models/vehiculos_model.dart';
import 'package:asistencia_vehicular/domain/repository/local_storage_repository.dart';
import 'package:asistencia_vehicular/domain/repository/vehiculo_repository.dart';
import 'package:asistencia_vehicular/domain/request/vehiculo_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class VehiculoController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final VehiculoRepositoryInterface vehiculoRepositoryInterface;
  VehiculoController(
      {required this.localRepositoryInterface,
      required this.vehiculoRepositoryInterface});

  final anhoTextController = TextEditingController();
  final marcaTextController = TextEditingController();
  final modeloTextController = TextEditingController();

  Rx<User> user = User.empty().obs;
  //Rx<String> token = " ".obs;
  List<Vehiculo> vehiculos = [];
  bool isLoading = true;

  final picker = ImagePicker();
  File? image;
  String? imagen64;

  @override
  void onReady() {
    loadUser();
    getVehiculo();
    super.onReady();
  }

  void loadUser() async {
    localRepositoryInterface.getUser().then((value) {
      user(value);
    });
  }

  Future<void> getVehiculo() async {
    final token = await localRepositoryInterface.getToken();
    try {
      final veh = await vehiculoRepositoryInterface.getVehiculos(token);
      vehiculos = veh;
      isLoading = false;
      update();
    } catch (_) {
      throw AuthException();
    }
  }

  Future<bool> addVehiculo() async {
    final token = await localRepositoryInterface.getToken();
    try {
      final vehiculo = VehiculoRequest(
          anhoTextController.text,
          modeloTextController.text.toUpperCase(),
          image,
          marcaTextController.text.toUpperCase());

      await vehiculoRepositoryInterface.addVehiculo(vehiculo, token, imagen64!);
      update();
      return true;
    } on AuthException catch (_) {
      return false;
    }
  }

  Future getImage() async {
    final a = await picker.pickImage(source: ImageSource.gallery);
    if (a == null) return;
    image = File(a.path);
    List<int> img = File(a.path).readAsBytesSync();
    final base64Img = base64Encode(img);
    imagen64 = base64Img;
    update();
  }
}
