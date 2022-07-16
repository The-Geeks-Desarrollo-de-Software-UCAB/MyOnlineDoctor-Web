import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counterController.dart';

class OtherScreen extends StatelessWidget {
  final CounterController _counterController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child:
                Text('Screen was clicked ${_counterController.counter.value}')),
        SizedBox(height: 10),
        Center(
            child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Go back')))
      ],
    ));
  }
}
