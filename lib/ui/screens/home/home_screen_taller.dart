import 'package:asistencia_vehicular/ui/screens/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/theme/colors.dart';

class HomeTallerScreen extends GetWidget<HomeController> {
  const HomeTallerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.grey[800],
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
                icon: const Icon(Icons.settings),
                activeIcon: const Icon(Icons.settings_applications),
                label: "Servicios",
                backgroundColor: bases,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person_add),
                activeIcon: const Icon(Icons.person_add_outlined),
                label: "Tecnicos",
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
            children: controller.pagesTaller,
          ),
        ),
      ),
    );
  }
}
