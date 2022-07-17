import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myonlinedoctorweb/widgets/large_screen.dart';
import 'package:myonlinedoctorweb/widgets/navbar.dart';
import 'package:myonlinedoctorweb/widgets/responsive.dart';
import 'package:myonlinedoctorweb/widgets/smallscreen.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: topNavigationBar(context, scaffoldKey),
        drawer: const Drawer(),
        body: const Responsive(
            largeScreen: LargeScreen(),
            smallScreen: SmallScreen(),
            mediumScreen: SmallScreen()));
  }
}
