import 'package:asistencia_vehicular/ui/screens/asistencia/asistencia_binding.dart';
import 'package:asistencia_vehicular/ui/screens/asistencia/asistencia_screen_create.dart';
import 'package:asistencia_vehicular/ui/screens/asistencia/asistencia_screen.dart';
import 'package:asistencia_vehicular/ui/screens/asistencia/asistencia_screen_taller.dart';
import 'package:asistencia_vehicular/ui/screens/asistencia/asistencia_screen_tecnico.dart';
import 'package:asistencia_vehicular/ui/screens/asistencia/asistencia_screen_title.dart';
import 'package:asistencia_vehicular/ui/screens/asistencia/asistencia_screen_title_taller.dart';
import 'package:asistencia_vehicular/ui/screens/asistencia/asistencia_screen_title_tecnico.dart';
import 'package:asistencia_vehicular/ui/screens/home/home_binding.dart';
import 'package:asistencia_vehicular/ui/screens/home/home_screen_taller.dart';
import 'package:asistencia_vehicular/ui/screens/home/home_screen_tecnico.dart';
import 'package:asistencia_vehicular/ui/screens/login/login_binding.dart';
import 'package:asistencia_vehicular/ui/screens/login/login_screen.dart';
import 'package:asistencia_vehicular/ui/screens/home/home_screen.dart';
import 'package:asistencia_vehicular/ui/screens/register/register_binding.dart';
import 'package:asistencia_vehicular/ui/screens/register/register_screen.dart';
import 'package:asistencia_vehicular/ui/screens/splash/splash_binding.dart';
import 'package:asistencia_vehicular/ui/screens/splash/splash_screen.dart';
import 'package:asistencia_vehicular/ui/screens/taller/taller_binding.dart';
import 'package:asistencia_vehicular/ui/screens/taller/taller_screen.dart';
import 'package:asistencia_vehicular/ui/screens/taller/taller_screen_create.dart';
import 'package:asistencia_vehicular/ui/screens/tecnico/tecnico_binding.dart';
import 'package:asistencia_vehicular/ui/screens/tecnico/tecnico_screen.dart';
import 'package:asistencia_vehicular/ui/screens/tecnico/tecnico_screen_create.dart';
import 'package:asistencia_vehicular/ui/screens/vehiculos/vehiculo_binding.dart';
import 'package:asistencia_vehicular/ui/screens/vehiculos/vehiculo_screen.dart';
import 'package:asistencia_vehicular/ui/screens/vehiculos/vehiculo_screen_create.dart';
import 'package:get/route_manager.dart';

class AsistenciaRoutes {
  static const String login = '/login';
  static const String splash = '/splash';
  static const String home = '/home';
  static const String register = '/register';
  static const String vehiculo = '/vehiculo';
  static const String vehiculocreate = '/vehiculocreate';
  static const String asistencia = '/asistencia';
  static const String asistenciatecnico = '/asistenciatecnico';
  static const String asistenciataller = '/asistenciataller';
  static const String navigation = '/navigation';
  static const String asistenciacreate = '/asistenciacreate';
  static const String taller = '/taller';
  static const String main = '/main';
  static const String hometaller = '/hometaller';
  static const String hometecnico = '/hometecnico';
  static const String serviciototallercreate = '/serviciototallercreate';
  static const String tecnico = '/tecnico';
  static const String tecnicocreate = '/tecnicocreate';
  static const String asistenciatitle = '/asistenciatitle';
  static const String asistenciatitletaller = '/asistenciatitletaller';
  static const String asistenciatitletecnico = '/asistenciatitletecnico';
  static const String tecnicos = '/tecnicos';
}

class AsistenciaPages {
  static final pages = [
    GetPage(
      name: AsistenciaRoutes.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AsistenciaRoutes.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AsistenciaRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AsistenciaRoutes.register,
      page: () => RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AsistenciaRoutes.vehiculo,
      page: () => VehiculoScreen(),
      binding: VehiculoBindgin(),
    ),
    GetPage(
      name: AsistenciaRoutes.vehiculocreate,
      page: () => VehiculoCreateScreen(),
    ),
    GetPage(
      name: AsistenciaRoutes.asistencia,
      page: () => AsistenciaScreen(),
      binding: AsistenciaBinding(),
    ),
    GetPage(
      name: AsistenciaRoutes.asistenciacreate,
      page: () => AsistenciaCreateScreen(),
    ),
    GetPage(
        name: AsistenciaRoutes.taller,
        page: () => TallerScreen(),
        binding: TallerBinding()),
    GetPage(
      name: AsistenciaRoutes.hometaller,
      page: () => HomeTallerScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AsistenciaRoutes.hometecnico,
      page: () => HomeTecnicoScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AsistenciaRoutes.serviciototallercreate,
      page: () => TallerCreateScreen(),
    ),
    GetPage(
      name: AsistenciaRoutes.tecnico,
      page: () => TecnicoScreen(),
      binding: TecnicoBinding(),
    ),
    GetPage(
      name: AsistenciaRoutes.tecnicocreate,
      page: () => TecnicoCreateScreen(),
    ),
    GetPage(
      name: AsistenciaRoutes.asistenciatitle,
      page: () => AsistenciaTitle(),
    ),
    GetPage(
      name: AsistenciaRoutes.asistenciatitletaller,
      page: () => AsistenciaTitleTaller(),
    ),
    GetPage(
      name: AsistenciaRoutes.asistenciatecnico,
      page: () => AsistenciaTecnicoScreen(),
    ),
    GetPage(
      name: AsistenciaRoutes.asistenciataller,
      page: () => AsistenciaTallerScreen(),
    ),
    GetPage(
      name: AsistenciaRoutes.asistenciatitletecnico,
      page: () => AsistenciaTitleTecnico(),
    ),
  ];
}
