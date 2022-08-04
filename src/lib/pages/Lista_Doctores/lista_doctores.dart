import 'package:flutter/material.dart';
import '../../constants/style.dart';

class ListaDoctores extends StatelessWidget {
  const ListaDoctores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          AppColors.MAINCOLOR1,
          AppColors.MAINCOLOR2,
        ],
      )),
    );
  }
}
