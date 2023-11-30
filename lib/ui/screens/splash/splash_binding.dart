import 'package:asistencia_vehicular/ui/screens/splash/splash_controller.dart';
import 'package:get/instance_manager.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(
        Get.find(),
        Get.find(),
      ),
    );
  }
}
