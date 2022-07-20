import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myonlinedoctorweb/constants/move_appoiment.dart';
import 'package:myonlinedoctorweb/controllers/menu_controller.dart';
import 'package:myonlinedoctorweb/controllers/navigation_controller.dart';
import 'package:myonlinedoctorweb/layout.dart';

import 'controllers/get_appoiments.dart';

void main() {
  Get.put(MenuController());
  Get.put(NavigationController());
  runApp(const MyOnlineDoctor());
}

class MyOnlineDoctor extends StatelessWidget {
  const MyOnlineDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MyOnlineDoctor",
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.black),
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
            }),
            primaryColor: Colors.blue),
        home: SiteLayout());
  }
}
