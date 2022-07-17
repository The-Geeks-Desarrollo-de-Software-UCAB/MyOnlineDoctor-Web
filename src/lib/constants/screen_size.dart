import 'package:flutter/material.dart';

class ScreenSize {
  static double screenSize(BuildContext context) =>
      MediaQuery.of(context).size.width;
}
