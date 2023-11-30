import 'package:asistencia_vehicular/domain/exeption/auth_exeption.dart';
import 'package:asistencia_vehicular/domain/request/login_request.dart';
import 'package:asistencia_vehicular/ui/screens/home/home_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../domain/repository/auth_repositoy.dart';
import '../../../domain/repository/local_storage_repository.dart';

class LoginController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final AuthRepositoryInterface authRepositoryInterface;
  var t;
  LoginController(this.authRepositoryInterface, this.localRepositoryInterface);

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  Future<bool> login() async {
    final email = emailTextController.text;
    final password = passwordTextController.text;
    try {
      final loginResponse = await authRepositoryInterface.login(
        LoginRequest(email, password),
      );
      await localRepositoryInterface.saveToken(loginResponse.token);
      await localRepositoryInterface.saveUser(loginResponse.user);
      final tipo = Get.find<HomeController>();
      final user = await localRepositoryInterface.getUser();
      tipo.loadTipo(user.tipo[0]);
      t = user.tipo[0];
      print(tipo.tipo);
      return true;
    } on AuthException catch (_) {
      return false;
    }
  }
}
