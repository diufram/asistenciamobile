import 'package:asistencia_vehicular/domain/repository/auth_repositoy.dart';
import 'package:asistencia_vehicular/domain/repository/local_storage_repository.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final localRepositoryInferface = Get.find<LocalRepositoryInterface>();
  final authRepositoryInterface = Get.find<AuthRepositoryInterface>();
  String tipo = "t";
  bool sw = false;
  NavigationController();

  Future<void> logout() async {
    final token = await localRepositoryInferface.getToken();
    await authRepositoryInterface.logout(token);
    await localRepositoryInferface.clearAllData();
  }
}
