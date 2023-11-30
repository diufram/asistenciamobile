import 'package:asistencia_vehicular/ui/screens/navbar/navigation_controller.dart';
import 'package:get/get.dart';

import '../../../data/datasource/local_repository_impl.dart';
import '../../../domain/repository/local_storage_repository.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImpl());
    Get.lazyPut(() => NavigationController());
  }
}
