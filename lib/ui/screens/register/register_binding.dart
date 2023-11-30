import 'package:asistencia_vehicular/ui/screens/register/register_controller.dart';
import 'package:get/get.dart';

import '../../../data/datasource/auth_repository_impl.dart';
import '../../../data/datasource/local_repository_impl.dart';
import '../../../domain/repository/auth_repositoy.dart';
import '../../../domain/repository/local_storage_repository.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImpl());
    Get.lazyPut<AuthRepositoryInterface>(() => AuthRepositoryImpl());
    Get.lazyPut(() => RegisterController(Get.find(), Get.find()));
  }
}
