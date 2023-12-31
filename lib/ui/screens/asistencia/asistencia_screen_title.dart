import 'package:asistencia_vehicular/domain/models/asistencia_model.dart';
import 'package:asistencia_vehicular/ui/routes/asistencia_navigation.dart';
import 'package:asistencia_vehicular/ui/screens/asistencia/asistencia_controller.dart';
import 'package:asistencia_vehicular/ui/screens/login/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
//import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

class AsistenciaTitle extends GetView<AsistenciaController> {
  AsistenciaTitle({super.key});
  final Asistencia asistencia = Get.arguments;
  final myPosition = LatLng(-17.786693, -63.179431);

  void cancelar() async {
    await controller.calcelarAsistencia(asistencia.id);
    Get.toNamed(AsistenciaRoutes.home);
  }

  void pagar() async {
    await controller.pagar(asistencia.id.toString());
    Get.toNamed(AsistenciaRoutes.home);
    //controller.makePayment();
  }

  void pdf() async {
    controller.writePDF();
    await controller.savePdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("ASISTENCIA"),
        leading: BackButton(onPressed: () => Get.back()),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 25, right: 25),
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              asistencia.url != "/storage/"
                  ? Image.network(
                      "http://3.144.236.115${asistencia.url}",
                      height: 300,
                      width: 300,
                    )
                  : const Text("LA IMAGEN NO SE PUDO CARGAR"),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "DESCRIPCION:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(asistencia.descripcion),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "SERVICIO:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(asistencia.nombre.toString()),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "TOTAL A PAGAR:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              asistencia.total == null
                  ? const Text("Aun no se Acordo el precio")
                  : Text("${asistencia.total.toString()} BOB."),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "TALLER:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(asistencia.tallerNombre.toString()),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "TECNICO:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(asistencia.tecnicoId.toString()),
              const SizedBox(
                height: 10,
              ),
              Obx(() => controller.ff.value == true
                  ? Text(controller
                      .file!.path) //PdfView(path: controller.file!.path)
                  : const Text(
                      "PDF:",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              asistencia.total != null
                  ? MyButton(onTap: pdf, text: "PDF")
                  : const SizedBox(
                      height: 10,
                    ),
              asistencia.total != null
                  ? Center(
                      child: Image.asset(
                        "lib/images/qr.jpeg",
                        height: 150,
                        width: 150,
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 10,
              ),
              asistencia.total == null
                  ? MyButton(onTap: cancelar, text: "CANCELAR")
                  : MyButton(onTap: pagar, text: "PAGAR"),
            ],
          ),
        ),
      ),
    );
  }
}
