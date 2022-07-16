import 'package:flutter/cupertino.dart';

class Responsive extends StatelessWidget {
  final Widget largeScreen;
  final Widget? smallScreen;
  final Widget? mediumScreen;

  const Responsive(
      {Key? key,
      required this.largeScreen,
      required this.smallScreen,
      required this.mediumScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenBreakPoint = ScreenBreakPoint(ScreenSize());
    return LayoutBuilder(builder: (context, constraints) {
      double _width = constraints.maxWidth;
      if (_width >= screenBreakPoint._largeScreenSize) {
        return largeScreen;
      } else if (_width < screenBreakPoint._largeScreenSize &&
          _width >= screenBreakPoint._mediumScreenSize) {
        return mediumScreen ?? largeScreen;
      } else {
        return smallScreen ?? largeScreen;
      }
    });
  }
}

// est ewidget pudiera usar una interface para el control del screen break point
// el ScreenBreakPoint pudiera ser un mediador el cual comunique a los distintos tamanos de screen
// la funcion para obtener el tamano del contexto la pudiera colocar en un afuncion aparte
// nota mi clase esta dependiendo de una clase concreta
class ScreenBreakPoint {
  final int _largeScreenSize = 1100;
  final int _mediumScreenSize = 768;
  final int _smallScreenSize = 768;
  final int _customScreenSize = 1100;
  final ScreenSize screenSize;

  ScreenBreakPoint(this.screenSize);

  bool isSmallScreen(BuildContext context) {
    return screenSize.screenSize(context) < _smallScreenSize;
  }

  bool isMediumScreen(BuildContext context) {
    return screenSize.screenSize(context) >= _mediumScreenSize &&
        screenSize.screenSize(context) < _largeScreenSize;
  }

  bool isLargeScreen(BuildContext context) {
    return screenSize.screenSize(context) >= _largeScreenSize;
  }

  bool isCustomScreen(BuildContext context) {
    return screenSize.screenSize(context) >= _mediumScreenSize &&
        screenSize.screenSize(context) <= _customScreenSize;
  }
}

class ScreenSize {
  double screenSize(BuildContext context) => MediaQuery.of(context).size.width;
}
