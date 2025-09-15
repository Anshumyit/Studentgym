import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_controller/bottomscreencontroller.dart';

class feesPlans extends StatelessWidget {
  const feesPlans({super.key});

  @override
  Widget build(BuildContext context) {
    var currentTime = DateTime.now().toString();
    var provider =Provider.of<BottomController>(context,listen: false);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/gymbackground.png'),
            fit: BoxFit.cover, // or BoxFit.fill or BoxFit.contain
          ),
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              "Gym Attendance",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Consumer<BottomController>(
              builder: (context, provider, child) {
                return Text(
                  provider?.currentTime?? "",
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Punch In", style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Punch Out", style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Punch Log",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

