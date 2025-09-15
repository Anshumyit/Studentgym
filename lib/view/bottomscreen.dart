import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_controller/bottomscreencontroller.dart';
import 'admissonform.dart';
import 'feesplans_screen.dart';
import 'homescreen.dart';

class Bottomscreen extends StatelessWidget {
  Bottomscreen({super.key});

  final List<Widget> screen = [
    Homescreen(),
    Admissonform(),
    feesPlans(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomController>(
      builder: (context, value, child) {
        return Scaffold(
          body: screen[value.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            currentIndex: value.currentIndex,
            onTap: value.selectscreen,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.admin_panel_settings_sharp), label: "Admission form"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Attendence"),
            ],
          ),

        );
      },
    );
  }
}
