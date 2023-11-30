import 'package:asistencia_vehicular/data/theme/colors.dart';
import 'package:asistencia_vehicular/ui/routes/asistencia_navigation.dart';
import 'package:asistencia_vehicular/ui/screens/tecnico/tecnico_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/my_button.dart';

class TecnicoScreen extends GetView {
  const TecnicoScreen({super.key});

  void agregarTecnico() async {
    Get.toNamed(AsistenciaRoutes.tecnicocreate);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        child: Column(
          children: [
            SizedBox(
              height: 550,
              width: MediaQuery.of(context).size.width,
              child: GetBuilder<TecnicoController>(
                builder: (controller) {
                  if (controller.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: controller.tecnico.length,
                      itemBuilder: ((context, index) {
                        final String nombre = controller.tecnico[index].name;
                        final String ubicacion =
                            controller.tecnico[index].telefono;
                        return ListTile(
                          title: Card(
                            elevation: 10,
                            color: bases,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "NOMBRE: ${nombre}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "TELEFONO: ${ubicacion}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              child: MyButton(onTap: agregarTecnico, text: "AGREGAR TECNICO"),
            ),
          ],
        ),
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
      ),
    );
  }
}
