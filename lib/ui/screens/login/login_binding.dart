import 'package:asistencia_vehicular/ui/screens/login/login_controller.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(
        Get.find(),
        Get.find(),
      ),
    );

    Get.lazyPut(() => HomeController());
  }
}
