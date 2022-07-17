import 'package:flutter/cupertino.dart';
import 'package:myonlinedoctorweb/constants/screen_size.dart';

class ScreenBreakPoint {
  final int largeScreenSize = 1100;
  final int mediumScreenSize = 768;
  final int smallScreenSize = 768;
  final int customScreenSize = 1100;

  ScreenBreakPoint();

  bool isSmallScreen(BuildContext context) {
    return ScreenSize.screenSize(context) < mediumScreenSize;
  }

  bool isMediumScreen(BuildContext context) {
    return ScreenSize.screenSize(context) >= mediumScreenSize &&
        ScreenSize.screenSize(context) < largeScreenSize;
  }

  bool isLargeScreen(BuildContext context) {
    return ScreenSize.screenSize(context) >= largeScreenSize;
  }

  bool isCustomScreen(BuildContext context) {
    return ScreenSize.screenSize(context) >= mediumScreenSize &&
        ScreenSize.screenSize(context) <= customScreenSize;
  }
}
