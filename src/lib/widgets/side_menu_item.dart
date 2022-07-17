import 'package:flutter/material.dart';
import 'package:myonlinedoctorweb/constants/screenbreakpoint.dart';
import 'package:myonlinedoctorweb/widgets/horizontal_menu_item.dart';
import 'package:myonlinedoctorweb/widgets/vertical_menu_item.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap; //puede que tenga errores con la funcion mas adelante

  const SideMenuItem({Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenBreakPoint =
        ScreenBreakPoint(); // estoy introduciendo una dependecia
    if (screenBreakPoint.isCustomScreen(context)) {
      return VerticalMenuItem(itemName: itemName, onTap: () {});
    }
    return HorizontalMenuItem(itemName: itemName, onTap: () {});
  }
}
