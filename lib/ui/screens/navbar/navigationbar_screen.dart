import 'package:asistencia_vehicular/data/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/asistencia_navigation.dart';
import 'navigation_controller.dart';

class NavBar extends GetView<NavigationController> {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) {
          navigate(value);
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            activeIcon: const Icon(Icons.home_filled),
            label: "Home",
            backgroundColor: bases,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_month),
            activeIcon: const Icon(Icons.calendar_month),
            label: "Asistencia",
            backgroundColor: bases,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.directions_car),
            activeIcon: const Icon(Icons.calendar_month),
            label: "Vehiculos",
            backgroundColor: bases,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.work),
            activeIcon: const Icon(Icons.work_history_outlined),
            label: "Vehiculos",
            backgroundColor: bases,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            activeIcon: const Icon(Icons.person_2),
            label: "Perfil",
            backgroundColor: bases,
          ),
        ]);
  }

  navigate(int index) {
    if (index == 0) {
      Get.offAllNamed(AsistenciaRoutes.home);
    } else if (index == 1) {
      Get.offAllNamed(AsistenciaRoutes.asistencia);
    } else if (index == 2) {
      Get.offAllNamed(AsistenciaRoutes.vehiculo);
    } else if (index == 3) {
      //ontroller.logout();
      Get.offAllNamed(AsistenciaRoutes.taller);
    }
  }
}
