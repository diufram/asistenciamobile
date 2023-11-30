import 'package:asistencia_vehicular/ui/screens/asistencia/asistencia_controller.dart';
import 'package:get/get.dart';

class AsistenciaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AsistenciaController(
        localRepositoryInterface: Get.find(),
        asistenciaRepositoryInterface: Get.find(),
      ),
    );
  }
}
