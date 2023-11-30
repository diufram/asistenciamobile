import 'package:asistencia_vehicular/domain/models/user_model.dart';

abstract class LocalRepositoryInterface {
  Future<String> getToken();
  Future<void> clearAllData();
  Future<User> saveUser(User user);
  Future<String> saveToken(String token);
  Future<User> getUser();
}
