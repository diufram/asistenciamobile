import 'package:asistencia_vehicular/domain/request/register_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/exeption/auth_exeption.dart';
import '../../../domain/repository/auth_repositoy.dart';
import '../../../domain/repository/local_storage_repository.dart';

class RegisterController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final AuthRepositoryInterface authRepositoryInterface;
  RegisterController(
      this.authRepositoryInterface, this.localRepositoryInterface);

  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final tallerNameTextController = TextEditingController();
  final telefonoTextController = TextEditingController();

  List<String> tipo = [
    "Cliente",
    "Tecnico",
    "Taller",
  ];
  String? selectedTipo;

  var s = "".obs;

  Rx<List<DropdownMenuItem<String>>> tipoDropDownMenuItem =
      Rx<List<DropdownMenuItem<String>>>(([]));

  Future<bool> register() async {
    final name = nameTextController.text;
    final email = emailTextController.text;
    final password = passwordTextController.text;

    try {
      String t = "";
      if (selectedTipo == "Cliente") {
        t = "c";
        final registerResponse = await authRepositoryInterface.register(
          RegisterRequest(name, email, password, t, "-", "-"),
        );
        await localRepositoryInterface.saveToken(registerResponse.token);
        await localRepositoryInterface.saveUser(registerResponse.user);
        return true;
      } else if (selectedTipo == "Tecnico") {
        t = "t";
        final registerResponse = await authRepositoryInterface.register(
          RegisterRequest(
              name, email, password, t, telefonoTextController.text, "-"),
        );
        await localRepositoryInterface.saveToken(registerResponse.token);
        await localRepositoryInterface.saveUser(registerResponse.user);
        return true;
      } else if (selectedTipo == "Taller") {
        t = "p";
        final registerResponse = await authRepositoryInterface.register(
          RegisterRequest(
            name,
            email,
            password,
            t,
            telefonoTextController.text,
            tallerNameTextController.text,
          ),
        );
        await localRepositoryInterface.saveToken(registerResponse.token);
        await localRepositoryInterface.saveUser(registerResponse.user);
      }
      return true;
    } on AuthException catch (_) {
      return false;
    }
  }
}
