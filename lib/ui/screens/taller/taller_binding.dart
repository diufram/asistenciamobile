import 'package:asistencia_vehicular/ui/screens/taller/taller_controller.dart';
import 'package:get/get.dart';

class TallerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => TallerController(
        Get.find(),
        Get.find(),
      ),
    );
  }
}
