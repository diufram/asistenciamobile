//import 'dart:convert';
import 'dart:io';
//import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:asistencia_vehicular/domain/models/servicioToTaller_model.dart';
import 'package:asistencia_vehicular/domain/models/servicio_model.dart';
import 'package:asistencia_vehicular/domain/models/taller_model.dart';
import 'package:asistencia_vehicular/domain/repository/asistencia_repository.dart';
import 'package:asistencia_vehicular/domain/repository/taller_repository.dart';
import 'package:asistencia_vehicular/domain/request/asistencia_request.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:pdf/pdf.dart';
//import 'package:http/http.dart' as http;

import 'package:pdf/widgets.dart' as pw;

import '../../../domain/exeption/auth_exeption.dart';
import '../../../domain/models/asistencia_model.dart';
import '../../../domain/models/user_model.dart';
import '../../../domain/repository/local_storage_repository.dart';

class AsistenciaController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;

  final AsistenciaRepositoryInterface asistenciaRepositoryInterface;

  AsistenciaController({
    required this.localRepositoryInterface,
    required this.asistenciaRepositoryInterface,
  });

  Map<String, dynamic>? paymentIntent;

  final cobro = TextEditingController();

  String? selectedTecnico;

  bool isLoading = true;

  var sw = false.obs;

  bool s1 = false;

  String? selectedServicio;
  var s = "".obs;

  String? selectedServicioToTaller;
  var st = "".obs;

  String? selectedTaller;
  var t = "".obs;

  List<Asistencia> asistencias = [];

  List<Servicio> servicios = [];

  List<ServicioToTaller> servicioToTallers = [];

  List<Taller> talleres = [];

  Rx<User> user = User.empty().obs;

  final descripcionTextController = TextEditingController();

  final picker = ImagePicker();
  File? image;

  double? latitude;
  double? longitude;
  LatLng? myPosition;

  @override
  void onReady() {
    loadUser();
    getAsistencia();
    getTaller();
    getPositionActual();
    getServicios();
    super.onReady();
  }

  void loadUser() async {
    localRepositoryInterface.getUser().then((value) {
      user(value);
    });
  }

  Future<Position> getPosicion() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('ERROR');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  void getPositionActual() async {
    Position position = await getPosicion();
    latitude = position.latitude;
    longitude = position.longitude;
    myPosition = LatLng(position.latitude, position.longitude);
  }

  int getServ() {
    for (var i = 0; i < servicios.length; i++) {
      if (selectedServicio == servicios[i].nombre) return servicios[i].id;
    }
    return 0;
  }

  Future<void> getTaller() async {
    final token = await localRepositoryInterface.getToken();
    try {
      final taller = Get.find<TallerRepositoryInterface>();
      final tallers = await taller.getTaller(token);
      talleres = tallers;
      update();
    } on AuthException catch (_) {}
  }

  Future<void> getServiciosToTaller() async {
    final token = await localRepositoryInterface.getToken();
    try {
      final servicio = await asistenciaRepositoryInterface.getServicioToTaller(
          getServ().toString(), token);
      servicioToTallers = servicio;
      if (servicio.isNotEmpty) {
        sw.value = true;
      } else {
        sw.value = false;
      }

      update();
    } on AuthException catch (_) {}
  }

  Future<void> getAsistencia() async {
    final token = await localRepositoryInterface.getToken();
    try {
      final asistencia =
          await asistenciaRepositoryInterface.getAsistencias(token);
      asistencias = asistencia;
      isLoading = false;
      update();
    } on AuthException catch (_) {}
  }

  Future getImage() async {
    final a = await picker.pickImage(source: ImageSource.gallery);
    if (a == null) return;
    image = File(a.path);
    update();
  }

  Future<bool> addAsistencia() async {
    try {
      final token = await localRepositoryInterface.getToken();
      final asistencia = AsistenciaRequest(
        descripcion: descripcionTextController.text,
        image: image,
        latitud: latitude!,
        longitud: longitude!,
        servicioId: getServ().toString(),
        tallerId: st.value,
      );
      await asistenciaRepositoryInterface.addAsistencia(asistencia, token);
      return true;
    } on AuthException catch (_) {
      return false;
    }
  }

  Future<void> getServicios() async {
    final token = await localRepositoryInterface.getToken();
    final servicio = await asistenciaRepositoryInterface.getAllServicios(token);
    servicios = servicio;
    update();
  }

  Future<void> calcelarAsistencia(int i) async {
    final token = await localRepositoryInterface.getToken();
    await asistenciaRepositoryInterface.cancelarAsistencia(i, token);
  }

  Future<void> asignarTecnico(String tecnicoid, String asistenciaid) async {
    final token = await localRepositoryInterface.getToken();
    await asistenciaRepositoryInterface.asignarTecnico(
        tecnicoid, asistenciaid, token);
  }

  Future<void> cobrar(String asistenciaid) async {
    final token = await localRepositoryInterface.getToken();
    await asistenciaRepositoryInterface.cobrar(cobro.text, asistenciaid, token);
  }

  Future<void> exportPDF() async {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("Hello World"),
          ); // Center
        }));
  }

  Future<void> pagar(String asistenciaid) async {
    final token = await localRepositoryInterface.getToken();
    await asistenciaRepositoryInterface.pagar(asistenciaid, token);
  }

/*
  //PAGOS
  void displayPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      print("EXITOSO");
    } catch (e) {
      print("FALLLO");
    }
  }

  createPayment() async {
    try {
      Map<String, dynamic> body = {"amount": "1000", "currency": "USD"};
      http.Response response = await http.post(
          Uri.parse("https://api.stripe.com/v1/payment_intents"),
          body: body,
          headers: {
            "Autorization":
                "Bearer sk_test_51OI1mMAZZIfQxvNA12tKQ6LQQsJYKnpaMFkOxq5iibZnHr4HOZ68kGZ0hlozCK6sVjp8ZW7uHFja9DzwWMmDJQhb00z5eSsZyj",
            "Content-Type": "application/x-www-form-urlencoded"
          });
      return json.decode(response.body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void makePayment() async {
    await createPayment();
    var gpay = const PaymentSheetGooglePay(
        merchantCountryCode: "US", currencyCode: "US", testEnv: true);
    Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntent!["client_secret"],
      style: ThemeMode.dark,
      merchantDisplayName: "Sabir",
      googlePay: gpay,
    ));
    displayPayment();
  }
  */
}
