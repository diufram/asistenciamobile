import 'dart:convert';
import 'package:asistencia_vehicular/domain/models/login_model.dart';
import 'package:asistencia_vehicular/domain/models/register_model.dart';
import 'package:asistencia_vehicular/domain/models/user_model.dart';
import 'package:asistencia_vehicular/domain/repository/auth_repositoy.dart';
import 'package:asistencia_vehicular/domain/request/login_request.dart';
import 'package:asistencia_vehicular/domain/request/register_request.dart';
import 'package:asistencia_vehicular/domain/response/login_response.dart';
import 'package:asistencia_vehicular/domain/response/register_response.dart';
import 'package:asistencia_vehicular/services/globals.dart';
import 'package:http/http.dart' as http;

import '../../domain/exeption/auth_exeption.dart';

class AuthRepositoryImpl extends AuthRepositoryInterface {
  @override
  Future<User> getUserFromToken(String token) async {
    Map<String, String> header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    var url = Uri.parse(baseURL + 'token');

    final response = await http.post(url, headers: header);

    if (response.statusCode == 200) {
      final User user = userFromJson(response.body);
      return user;
    }
    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    Map data = {
      "email": login.email,
      "password": login.password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'login');
    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final Login dat = loginFromJson(response.body);
      final user = User(
          id: dat.user.id,
          name: dat.user.name,
          email: dat.user.email,
          tipo: dat.user.tipo);
      final log = LoginResponse(dat.accessToken, user);
      print(dat.accessToken);
      return log;
    } else {
      throw AuthException();
    }
  }

  @override
  Future<void> logout(String token) async {
    Map<String, String> header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    var url = Uri.parse(baseURL + 'logout');
    await http.get(url, headers: header);
  }

  @override
  Future<RegisterResponse> register(RegisterRequest register) async {
    Map data = {
      "email": register.email,
      "password": register.password,
      "name": register.name,
      "tipo": register.tipo,
      "nameTaller": register.nameTaller,
      "telefono": register.telefono
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'register');
    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final Register registro = registerFromJson(response.body);
      final user = User(
          id: registro.user.id,
          name: registro.user.name,
          email: registro.user.email,
          tipo: registro.user.tipo);
      final reg = RegisterResponse(registro.accessToken, user);
      return reg;
    } else {
      throw AuthException();
    }
  }
}
