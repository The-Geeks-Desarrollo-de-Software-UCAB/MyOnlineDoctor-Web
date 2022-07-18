import 'package:get/get.dart';
import 'package:myonlinedoctorweb/widgets/side_menu_item.dart';
import '../constants/controllers.dart';
import '../routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:myonlinedoctorweb/constants/screen_size.dart';
import 'package:myonlinedoctorweb/constants/style.dart';
import 'package:myonlinedoctorweb/routing/routes.dart';
import 'package:myonlinedoctorweb/widgets/custom_text.dart';

import '../constants/screenbreakpoint.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = ScreenSize.screenSize(context);
    final screenBreakPoint = ScreenBreakPoint();

    return Container(
        color: light,
        child: ListView(
          children: [
            if (screenBreakPoint.isSmallScreen(context))
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      SizedBox(width: _width / 48),
                      Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Image.asset(
                            "../assets/icons/cardiology.png",
                            width: 28,
                          )),
                      Flexible(
                          child: CustomText(
                              text: "Menu",
                              size: 20,
                              color: active,
                              weight: FontWeight.bold)),
                      SizedBox(width: _width / 48)
                    ],
                  ),
                ],
              ),
            const Divider(color: Colors.transparent),
            Column(
                mainAxisSize: MainAxisSize.min,
                children: sideMenuItems
                    .map((itemName) => SideMenuItem(
                        itemName: itemName == scheduledPageRoute
                            ? "Citas por Agendar"
                            : itemName,
                        onTap: () {
                          if (!menuController.isActive(itemName)) {
                            menuController.changeActiveitemTo(itemName);
                            if (screenBreakPoint.isSmallScreen(context)) {
                              Get.back();
                            }
                            navigationController.navigateTo(itemName);

                            // ignore: todo
                            //TODO go to item name route
                          }
                        }))
                    .toList()),
          ],
        ));
  }
}
