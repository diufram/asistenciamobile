import 'package:asistencia_vehicular/ui/routes/asistencia_navigation.dart';
import 'package:asistencia_vehicular/ui/screens/navbar/navigation_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/theme/colors.dart';

class NavDrawer extends GetView<NavigationController> {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bases,
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),

          //OTRAS PAGINAS

          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.white,
                size: 35,
              ),
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                navigate(0);
              },
            ),
          ),

          //

          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
                leading: const Icon(
                  Icons.directions_car,
                  color: Colors.white,
                  size: 35,
                ),
                title: const Text(
                  'Vehiculos',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  navigate(1);
                }),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: controller.tipo == 'c' || controller.tipo == 't'
                ? ListTile(
                    leading: const Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                      size: 35,
                    ),
                    title: const Text(
                      'Asistencia',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      navigate(2);
                    })
                : const SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: controller.tipo == 'c'
                ? ListTile(
                    leading: const Icon(
                      Icons.work,
                      color: Colors.white,
                      size: 35,
                    ),
                    title: const Text(
                      'Taller',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      navigate(2);
                    })
                : const SizedBox(),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: const Icon(
                Icons.logout_rounded,
                color: Colors.white,
                size: 35,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                navigate(3);
              },
            ),
          )
        ],
      ),
    );
  }

  navigate(int index) {
    if (index == 0) {
      Get.offAllNamed(AsistenciaRoutes.home);
    } else if (index == 1) {
      Get.offAllNamed(AsistenciaRoutes.vehiculo);
    } else if (index == 2) {
      Get.offAllNamed(AsistenciaRoutes.asistencia);
    } else if (index == 3) {
      controller.logout();
      Get.offAllNamed(AsistenciaRoutes.login);
    }
  }
}
