import 'package:asistencia_vehicular/ui/screens/home/home_controller.dart';
import 'package:asistencia_vehicular/ui/screens/taller/taller_controller.dart';
import 'package:asistencia_vehicular/ui/screens/tecnico/tecnico_controller.dart';
import 'package:asistencia_vehicular/ui/screens/vehiculos/vehiculo_controller.dart';
import 'package:get/get.dart';

import '../../../data/datasource/asistencia_repository_impl.dart';
import '../../../data/datasource/auth_repository_impl.dart';
import '../../../data/datasource/local_repository_impl.dart';
import '../../../data/datasource/servicio_repository_impl.dart';
import '../../../data/datasource/taller_repository_impl.dart';
import '../../../data/datasource/vehiculos_repositori_impl.dart';
import '../../../domain/repository/asistencia_repository.dart';
import '../../../domain/repository/auth_repositoy.dart';
import '../../../domain/repository/local_storage_repository.dart';
import '../../../domain/repository/servicio_repository.dart';
import '../../../domain/repository/taller_repository.dart';
import '../../../domain/repository/vehiculo_repository.dart';
import '../asistencia/asistencia_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepositoryInterface>(() => AuthRepositoryImpl());
    Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImpl());
    Get.lazyPut(
      () => HomeController(),
    );
    Get.lazyPut<ServicioRepositoryInterface>(
      () => ServicioRepositotyImpl(),
    );
    Get.lazyPut<VehiculoRepositoryInterface>(
      () => VehiculoRepositoryImpl(),
    );
    Get.lazyPut<TallerRepositoryInterface>(
      () => TallerRepositoryImpl(),
    );

    Get.lazyPut<AsistenciaRepositoryInterface>(
      () => AsistenciaRepositoryImpl(),
    );
    Get.lazyPut(
      () => AsistenciaController(
        localRepositoryInterface: Get.find(),
        asistenciaRepositoryInterface: Get.find(),
      ),
    );
    Get.lazyPut(() => VehiculoController(
        localRepositoryInterface: Get.find(),
        vehiculoRepositoryInterface: Get.find()));

    Get.lazyPut(
      () => TallerController(
        Get.find(),
        Get.find(),
      ),
    );
    Get.lazyPut(
      () => TecnicoController(
        Get.find(),
        Get.find(),
      ),
    );
  }
}
