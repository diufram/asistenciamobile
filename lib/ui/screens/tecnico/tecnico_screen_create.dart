import 'package:asistencia_vehicular/ui/screens/login/my_button.dart';
import 'package:asistencia_vehicular/ui/screens/tecnico/tecnico_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/asistencia_navigation.dart';

class TecnicoCreateScreen extends GetWidget<TecnicoController> {
  const TecnicoCreateScreen({super.key});

  void addTecnico() async {
    final result = await controller.addTecnico();
    if (result) {
      Get.snackbar("Tecnico Agregado", "Exitoso");
      Get.offAllNamed(AsistenciaRoutes.hometaller);
    } else {
      Get.snackbar("Error", "Error al agregar Tecnico");
    }
  }

  @override
  Widget build(BuildContext context) {
    //inal Completer<GoogleMapController> _controller = Completer();
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Get.back(),
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey[800],
          elevation: 0,
          title: const Text(
            'AGRAGAR TECNICO',
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(25),
          child: SafeArea(
            child: SingleChildScrollView(
              child: GetBuilder<TecnicoController>(
                builder: (controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          filled: true,

                          fillColor: Color.fromARGB(255, 238, 238, 238),
                          //hintStyle: TextStyle(color: Colors.grey),
                        ),
                        dropdownColor: Colors.grey[200],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        hint: Obx(() => controller.st.value == ""
                            ? const Text("SELECCIONA EL TECNICO")
                            : Text(controller.selectedTecnico
                                .toString()
                                .toUpperCase())),
                        onChanged: (newValue) {
                          controller.selectedTecnico = newValue.toString();
                          controller.st.value = newValue.toString();
                          print(controller.st.value);
                        },
                        value: controller.selectedTecnico,
                        items: controller.tecnicos.map((selectedType) {
                          return DropdownMenuItem(
                            child: Text(selectedType.name),
                            value: selectedType.id,
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 30,
                        child: MyButton(
                            onTap: addTecnico,
                            text: "AGREGAR TECNICO AL TALLER"),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ));
  }
}
