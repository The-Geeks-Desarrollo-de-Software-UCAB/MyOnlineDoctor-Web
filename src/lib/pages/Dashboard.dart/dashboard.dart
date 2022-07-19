import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myonlinedoctorweb/constants/controllers.dart';
import '../../constants/style.dart';
import '../../constants/screenbreakpoint.dart';
import '../../widgets/custom_text.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenBreakPoint screenBreakPoint = ScreenBreakPoint();
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            AppColors.MAINCOLOR1,
            AppColors.MAINCOLOR2,
          ],
        )),
        child: Row(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  flex: 20,
                  child: Container(
                    padding:
                        const EdgeInsets.only(right: 260, left: 260, top: 30),
                    child: const CustomText(
                      text: 'Mis Pacientes',
                      size: 30,
                      weight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 100,
                  child: Container(
                      padding:
                          const EdgeInsets.only(right: 195, left: 195, top: 30),
                      child: const CustomText(
                        text: 'Citas del Dia',
                        size: 30,
                        weight: FontWeight.bold,
                        color: Colors.white,
                      )))
            ],
          )
        ]));
  }
}
