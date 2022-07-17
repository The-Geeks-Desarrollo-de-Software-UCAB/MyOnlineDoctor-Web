import 'package:flutter/cupertino.dart';

class ScreenBreakPoint {
  final int largeScreenSize = 1100;
  final int mediumScreenSize = 768;
  final int smallScreenSize = 768;
  final int customScreenSize = 1100;
  final ScreenSize screenSize;

  ScreenBreakPoint(this.screenSize);

  bool isSmallScreen(BuildContext context) {
    return screenSize.screenSize(context) < mediumScreenSize;
  }

  bool isMediumScreen(BuildContext context) {
    return screenSize.screenSize(context) >= mediumScreenSize &&
        screenSize.screenSize(context) < largeScreenSize;
  }

  bool isLargeScreen(BuildContext context) {
    return screenSize.screenSize(context) >= largeScreenSize;
  }

  bool isCustomScreen(BuildContext context) {
    return screenSize.screenSize(context) >= mediumScreenSize &&
        screenSize.screenSize(context) <= customScreenSize;
  }
}

class ScreenSize {
  double screenSize(BuildContext context) => MediaQuery.of(context).size.width;
}
