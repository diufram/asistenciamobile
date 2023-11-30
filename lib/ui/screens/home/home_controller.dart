import 'package:asistencia_vehicular/domain/repository/auth_repositoy.dart';
import 'package:asistencia_vehicular/ui/screens/asistencia/asistencia_screen.dart';
import 'package:asistencia_vehicular/ui/screens/asistencia/asistencia_screen_taller.dart';
import 'package:asistencia_vehicular/ui/screens/taller/taller_screen.dart';
import 'package:asistencia_vehicular/ui/screens/tecnico/tecnico_screen.dart';
import 'package:asistencia_vehicular/ui/screens/user/user_screen.dart';
import 'package:asistencia_vehicular/ui/screens/vehiculos/vehiculo_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../domain/models/user_model.dart';

import '../../../domain/repository/local_storage_repository.dart';
import '../asistencia/asistencia_screen_tecnico.dart';

class HomeController extends GetxController {
  Rx<User> user = User.empty().obs;
  var nombre;
  var tipo;
  List<Widget> pagesTaller = [
    const AsistenciaTallerScreen(),
    const TallerScreen(),
    const TecnicoScreen(),
    const UserScreen(),
  ];

  List<Widget> pagesCliente = [
    const AsistenciaScreen(),
    const VehiculoScreen(),
    const UserScreen()
  ];

  List<Widget> pagesTecnico = [
    const AsistenciaTecnicoScreen(),
    const UserScreen(),
  ];

  var pag = 0;

  void changeTabIndex(int index) {
    pag = index;
    update();
  }

  @override
  void onReady() {
    loadUser();
    super.onReady();
  }

  void loadTipo(String t) {
    tipo = t;
    update();
  }

  void loadUser() async {
    final LocalRepositoryInterface localRepositoryInterface =
        Get.find<LocalRepositoryInterface>();
    localRepositoryInterface.getUser().then((value) {
      nombre = value.name.toUpperCase();
      tipo = value.tipo;
      update();
      user(value);
    });
  }

  Future<void> logout() async {
    final LocalRepositoryInterface localRepositoryInterface =
        Get.find<LocalRepositoryInterface>();
    final AuthRepositoryInterface authRepositoryInterface =
        Get.find<AuthRepositoryInterface>();
    final token = await localRepositoryInterface.getToken();
    print(token);
    await authRepositoryInterface.logout(token);
    await localRepositoryInterface.clearAllData();
  }
}
