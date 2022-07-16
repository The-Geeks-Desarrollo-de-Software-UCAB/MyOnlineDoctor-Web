import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myonlinedoctorweb/pages/other.dart';
import '../controllers/counterController.dart';

class DashBoard extends StatelessWidget {
  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('Click: ${counterController.counter.value}')),
              SizedBox(height: 10),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(OtherScreen());
                      },
                      child: const Text('Open other Screen')))
            ],
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            counterController.increment();
          },
          child: const Icon(Icons.add)),
    );
  }
}
