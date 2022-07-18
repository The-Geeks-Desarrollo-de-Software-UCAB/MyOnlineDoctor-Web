import 'package:flutter/material.dart';
import 'package:myonlinedoctorweb/Modules.dart/Cita.dart';
import 'package:myonlinedoctorweb/constants/screen_size.dart';
import 'package:myonlinedoctorweb/widgets/info_cards.dart';

class ScheduleAppoimentLargeScreen extends StatelessWidget {
  const ScheduleAppoimentLargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = ScreenSize.screenSize(context);
    return Row(
      children: [
        const Padding(padding: EdgeInsets.only(left: 30)),
        CitaCard(
          cita: Cita('Patricio', 'Lesion muscular'),
          onTap: () {
            return print('hola bebe');
          },
          topColor: const Color(0xFF0FAB98),
        ),
        SizedBox(
          width: _width / 64,
        ),
        CitaCard(
          cita: Cita('Pablo', 'Se cayo'),
          onTap: () {
            return print('hola bebe');
          },
          topColor: const Color(0xFF0FAB98),
        ),
        SizedBox(
          width: _width / 64,
        ),
        CitaCard(
          cita: Cita('Gabriela', 'Dolor Estomacal'),
          onTap: () {
            return print('hola bebe');
          },
          topColor: const Color(0xFF0FAB98),
        ),
        SizedBox(
          width: _width / 64,
        )
      ],
    );
  }
}
