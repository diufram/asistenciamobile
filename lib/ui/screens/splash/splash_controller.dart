import 'package:asistencia_vehicular/ui/routes/asistencia_navigation.dart';

//import 'package:asistencia_vehicular/ui/screens/navbar/navigation_controller.dart';
import 'package:get/get.dart';

import '../../../domain/repository/auth_repositoy.dart';
import '../../../domain/repository/local_storage_repository.dart';

class SplashController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final AuthRepositoryInterface authRepositoryInterface;
  SplashController(this.authRepositoryInterface, this.localRepositoryInterface);
  @override
  void onReady() {
    validateSession();
    super.onReady();
  }

  void validateSession() async {
    //localRepositoryInterface.clearAllData();
    final token = await localRepositoryInterface.getToken();
    print(token);

    if (token != "null") {
      final user = await authRepositoryInterface.getUserFromToken(token);
      await localRepositoryInterface.saveUser(user);
      if (user.tipo[0] == "c") {
        Get.offNamed(AsistenciaRoutes.home);
      } else if (user.tipo[0] == "p") {
        Get.offNamed(AsistenciaRoutes.hometaller);
      } else if (user.tipo[0] == "t") {
        Get.offNamed(AsistenciaRoutes.hometecnico);
      }
    } else {
      Get.offNamed(AsistenciaRoutes.login);
    }
  }
}
