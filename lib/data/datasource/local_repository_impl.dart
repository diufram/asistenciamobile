import 'package:asistencia_vehicular/domain/models/user_model.dart';
import 'package:asistencia_vehicular/domain/repository/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _prefToken = "TOKEN";
const _prefName = "NAME";
const _prefId = "ID";
const _prefEmail = "EMAIL";
const _prefTipo = "c";

class LocalRepositoryImpl extends LocalRepositoryInterface {
  @override
  Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_prefToken).toString();
  }

  @override
  Future<User> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final id = sharedPreferences.getString(_prefId);
    final name = sharedPreferences.getString(_prefName);
    final email = sharedPreferences.getString(_prefEmail);
    final tipo = sharedPreferences.getString(_prefTipo);
    final user = User(
      id: int.parse(id.toString()),
      name: name.toString(),
      email: email.toString(),
      tipo: tipo.toString(),
    );
    return user;
  }

  @override
  Future<String> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_prefToken, token);
    return token;
  }

  @override
  Future<User> saveUser(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_prefId, user.id.toString());
    sharedPreferences.setString(_prefName, user.name.toString());
    sharedPreferences.setString(_prefEmail, user.email.toString());
    sharedPreferences.setString(_prefTipo, user.tipo.toString());
    return user;
  }
}
