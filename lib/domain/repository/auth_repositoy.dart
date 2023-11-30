import 'package:asistencia_vehicular/domain/models/user_model.dart';
import 'package:asistencia_vehicular/domain/request/login_request.dart';
import 'package:asistencia_vehicular/domain/request/register_request.dart';
import 'package:asistencia_vehicular/domain/response/login_response.dart';
import 'package:asistencia_vehicular/domain/response/register_response.dart';

abstract class AuthRepositoryInterface {
  Future<User> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest login);
  Future<RegisterResponse> register(RegisterRequest register);
  Future<void> logout(String token);
}
