import 'package:asistencia_vehicular/ui/screens/vehiculos/vehiculo_controller.dart';
import 'package:get/get.dart';

//import '../../../data/datasource/local_repository_impl.dart';
//import '../../../domain/repository/local_storage_repository.dart';

class VehiculoBindgin extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VehiculoController(
        localRepositoryInterface: Get.find(),
        vehiculoRepositoryInterface: Get.find()));
  }
}
