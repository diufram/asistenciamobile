import 'package:asistencia_vehicular/ui/routes/asistencia_navigation.dart';
import 'package:asistencia_vehicular/ui/screens/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/my_button.dart';
import '../login/my_textfield.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  void register() async {
    final result = await controller.register();
    if (result) {
      if (controller.selectedTipo == "Cliente") {
        Get.offAllNamed(AsistenciaRoutes.home);
      } else if (controller.selectedTipo == "Tecnico") {
        Get.offAllNamed(AsistenciaRoutes.hometecnico);
      } else if (controller.selectedTipo == "Taller") {
        Get.offAllNamed(AsistenciaRoutes.hometaller);
      }
    } else {
      Get.snackbar("Error", "Error en el registro");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: ListView(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // LOGO
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  // MENSAJE DE BIENVENIDA
                  Text(
                    "Listo para crear tu cuenta",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // NAME TEXTFIELD
                  MyTextField(
                      controller: controller.nameTextController,
                      hintText: 'Nombre',
                      obscureText: false),

                  const SizedBox(
                    height: 10,
                  ),
                  // EMAIL TEXTFIELD
                  MyTextField(
                      controller: controller.emailTextController,
                      hintText: 'Email',
                      obscureText: false),

                  const SizedBox(
                    height: 10,
                  ),

                  // PASSWORD TEXTFIELD
                  MyTextField(
                      controller: controller.passwordTextController,
                      hintText: 'Passwrod',
                      obscureText: true),

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
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    hint: Obx(() => controller.s.value == ""
                        ? const Text("SELECCIONA EL TIPO DE USUARIO")
                        : Text(
                            controller.selectedTipo.toString().toUpperCase())),
                    onChanged: (newValue) {
                      controller.selectedTipo = newValue.toString();
                      controller.s.value = newValue.toString();
                    },
                    value: controller.selectedTipo,
                    items: controller.tipo.map((selectedType) {
                      return DropdownMenuItem(
                        child: Text(selectedType),
                        value: selectedType,
                      );
                    }).toList(),
                  ),
                  Obx(
                    () => controller.s.value == "Taller"
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              MyTextField(
                                  controller:
                                      controller.tallerNameTextController,
                                  hintText: 'Nombre del taller',
                                  obscureText: false),
                              const SizedBox(
                                height: 10,
                              ),
                              MyTextField(
                                  controller: controller.telefonoTextController,
                                  hintText: 'Telefono',
                                  obscureText: false)
                            ],
                          )
                        : controller.s.value == "Tecnico"
                            ? Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  MyTextField(
                                      controller:
                                          controller.telefonoTextController,
                                      hintText: 'Telefono',
                                      obscureText: false)
                                ],
                              )
                            : const SizedBox(),
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  // BOTON DE INICIO
                  MyButton(onTap: register, text: 'Registrate'),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ya tienes una cuenta?",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/login');
                        },
                        child: const Text(
                          "Iniciar Session",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // IR A REGISTRO
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
