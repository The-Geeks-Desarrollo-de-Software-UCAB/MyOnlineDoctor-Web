//EN DESARROLLO

import 'package:flutter/material.dart';
import 'package:myonlinedoctorweb/constants/move_appoiment.dart';
import 'package:myonlinedoctorweb/constants/screen_size.dart';
import 'package:myonlinedoctorweb/pages/Dashboard.dart/dashboard.dart';
import 'package:myonlinedoctorweb/widgets/custom_text.dart';
import 'package:myonlinedoctorweb/widgets/info_cita_agendada_card.dart';

import '../../Modules/cita.dart';

import '../../service.dart/get_appoiments.dart';

class AppoimentsOfTheDay extends StatefulWidget {
  const AppoimentsOfTheDay({Key? key}) : super(key: key);

  @override
  State<AppoimentsOfTheDay> createState() => _AppoimentsOfTheDayState();
}

class _AppoimentsOfTheDayState extends State<AppoimentsOfTheDay> {
  final GetAppoimentMock test = GetAppoimentMock();
  final Set<Cita> scheduledAppoiments = {}; //

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Container(
            padding: const EdgeInsets.only(right: 195, left: 195, top: 30),
            child: const CustomText(
              text: 'Citas del Dia',
              size: 30,
              weight: FontWeight.bold,
              color: Colors.white,
            )),
        Expanded(
            child: FutureBuilder(
                future: test.getAppoiment(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    final width = ScreenSize.screenSize(context);

                    setState(() {});
                    return listToDayAppoimentCard(
                        context, snapshot.data as List<Cita>, width);
                  }
                }))
      ],
    ));
  }
}

Widget listToDayAppoimentCard(
    BuildContext context, List<Cita> citas, double width) {
  // ScheduledAppoiment storedAppoiment = ScheduledAppoiment();

  if (citas.length > scheduledAppoiments.length) {
    for (final value in citas) {
      scheduledAppoiments.add(value);
    }
  }
  return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: scheduledAppoiments.length,
      itemBuilder: ((context, index) {
        return Container(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
            child: CitaAgendadaCard(
              cita: scheduledAppoiments[index],
              topColor: const Color(0xFF0FAB98),
            ));
      }));
}
