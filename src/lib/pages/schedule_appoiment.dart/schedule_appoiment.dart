import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myonlinedoctorweb/constants/controllers.dart';
import 'package:myonlinedoctorweb/constants/screenbreakpoint.dart';
import 'package:myonlinedoctorweb/constants/style.dart';
import 'package:myonlinedoctorweb/pages/schedule_appoiment.dart/widgets/squedule_cars_large.dart';
import 'package:myonlinedoctorweb/widgets/custom_text.dart';

class ScheduleAppoiment extends StatelessWidget {
  const ScheduleAppoiment({Key? key}) : super(key: key);

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
        child: Column(
          children: [
            Obx(() => Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 460),
                      margin: EdgeInsets.only(
                          top:
                              screenBreakPoint.isSmallScreen(context) ? 56 : 50,
                          left: 30,
                          bottom: 30),
                      child: CustomText(
                          text: menuController.activeItem.value,
                          size: 35,
                          weight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                )),
            const Divider(color: Colors.transparent),
            const Expanded(
              child: ScheduleAppoimentLargeScreen(),
            )
          ],
        ));
  }
}
