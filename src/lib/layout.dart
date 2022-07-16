import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myonlinedoctorweb/widgets/largescreen.dart';
import 'package:myonlinedoctorweb/widgets/responsive.dart';
import 'package:myonlinedoctorweb/widgets/smallscreen.dart';

class SiteLayout extends StatelessWidget {
  const SiteLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: const Responsive(
          largeScreen: LargeScreen(),
          smallScreen: SmallScreen(),
          mediumScreen: SmallScreen(),
        ));
  }
}
