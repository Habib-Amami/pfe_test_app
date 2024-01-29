import 'package:flutter/material.dart';
import 'package:pfe_test_app/screens/calender_screen.dart';
import 'package:pfe_test_app/screens/equipment_screen.dart';
import 'package:pfe_test_app/screens/profile_screen.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int currentPageIndex = 1;
  final List<Widget> menuScreens = const [
    EquipmentSreen(),
    CalenderScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        onDestinationSelected: (int index) {
          setState(
            () {
              currentPageIndex = index;
            },
          );
        },
        animationDuration: const Duration(
          milliseconds: 500,
        ),
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.construction,
            ),
            icon: Icon(
              Icons.construction_outlined,
            ),
            label: "Equipment",
            tooltip: "Equipment List",
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.calendar_month,
            ),
            icon: Icon(
              Icons.calendar_month_outlined,
            ),
            label: "Calender",
            tooltip: "Tasks Calender",
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
            ),
            icon: Icon(
              Icons.person_outlined,
            ),
            label: "Profile",
            tooltip: "Profile info",
          ),
        ],
      ),
      body: menuScreens[currentPageIndex],
    );
  }
}
