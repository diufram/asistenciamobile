import 'package:asistencia_vehicular/ui/screens/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/theme/colors.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Center(
              child: Text(
                "WELCOME ${controller.nombre}",
              ),
            )),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.pag,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey.withOpacity(0.5),
            type: BottomNavigationBarType.shifting,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            onTap: controller.changeTabIndex,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.calendar_month),
                activeIcon: const Icon(Icons.calendar_month_outlined),
                label: "Asistencia",
                backgroundColor: bases,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.directions_car),
                activeIcon: const Icon(Icons.directions_car_outlined),
                label: "Vehiculos",
                backgroundColor: bases,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                activeIcon: const Icon(Icons.person_2),
                label: "Perfil",
                backgroundColor: bases,
              ),
            ]),
        body: SafeArea(
          child: IndexedStack(
            index: controller.pag,
            children: controller.pagesCliente,
          ),
        ),
      ),
    );
  }
}
