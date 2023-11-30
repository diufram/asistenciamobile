import 'package:asistencia_vehicular/ui/routes/asistencia_navigation.dart';
import 'package:asistencia_vehicular/ui/screens/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_button.dart';
import 'my_textfield.dart';

class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({super.key});

  void login() async {
    final result = await controller.login();
    if (result) {
      if (controller.t == "c") {
        Get.offAllNamed(AsistenciaRoutes.home);
      } else if (controller.t == "p") {
        Get.offAllNamed(AsistenciaRoutes.hometaller);
      } else if (controller.t == "t") {
        Get.offAllNamed(AsistenciaRoutes.hometecnico);
      } else {
        Get.snackbar("Error", "Login Incorrect");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // LOGO
                  //Image.asset("lib/images/icono.png"),

                  const SizedBox(
                    height: 50,
                  ),

                  // MENSAJE DE BIENVENIDA
                  Text(
                    "Bienvenido ",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    height: 25,
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
                    height: 25,
                  ),
                  // BOTON DE INICIO
                  MyButton(onTap: login, text: 'Iniciar Session'),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "No tienes una cuenta aun?",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAllNamed(AsistenciaRoutes.register);
                        },
                        child: const Text(
                          "Registrate Ahora",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      )
                    ],
                  )
                  // IR A REGISTRO
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
