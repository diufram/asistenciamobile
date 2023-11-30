import 'package:asistencia_vehicular/data/datasource/asistencia_repository_impl.dart';

import 'package:asistencia_vehicular/data/datasource/taller_repository_impl.dart';
import 'package:asistencia_vehicular/data/datasource/vehiculos_repositori_impl.dart';
import 'package:asistencia_vehicular/domain/repository/asistencia_repository.dart';

import 'package:asistencia_vehicular/domain/repository/taller_repository.dart';
import 'package:asistencia_vehicular/domain/repository/vehiculo_repository.dart';
import 'package:get/get.dart';
import 'package:asistencia_vehicular/data/datasource/local_repository_impl.dart';
import 'package:asistencia_vehicular/domain/repository/local_storage_repository.dart';
import '../data/datasource/auth_repository_impl.dart';
import '../domain/repository/auth_repositoy.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepositoryInterface>(() => AuthRepositoryImpl());
    Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImpl());
    Get.lazyPut<AsistenciaRepositoryInterface>(
        () => AsistenciaRepositoryImpl());
    Get.lazyPut<VehiculoRepositoryInterface>(() => VehiculoRepositoryImpl());
    Get.lazyPut<TallerRepositoryInterface>(() => TallerRepositoryImpl());
  }
}
