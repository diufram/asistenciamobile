import 'package:asistencia_vehicular/domain/models/user_model.dart';

class LoginResponse {
  const LoginResponse(this.token, this.user);
  final String token;
  final User user;
}
