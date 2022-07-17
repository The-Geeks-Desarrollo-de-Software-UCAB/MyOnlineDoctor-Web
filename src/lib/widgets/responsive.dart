import 'package:flutter/cupertino.dart';
import '../constants/screenbreakpoint.dart';

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
    final screenBreakPoint =
        ScreenBreakPoint(ScreenSize()); // estoy creando una dependencia.
    return LayoutBuilder(builder: (context, constraints) {
      double _width = constraints.maxWidth;
      if (_width >= screenBreakPoint.largeScreenSize) {
        return largeScreen;
      } else if (_width < screenBreakPoint.largeScreenSize &&
          _width >= screenBreakPoint.mediumScreenSize) {
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
