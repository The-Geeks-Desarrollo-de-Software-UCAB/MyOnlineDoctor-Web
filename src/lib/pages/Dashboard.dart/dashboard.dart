import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myonlinedoctorweb/Modules/cita.dart';
import 'package:myonlinedoctorweb/constants/screen_size.dart';
import 'package:myonlinedoctorweb/service.dart/get_appoiments.dart';
import 'package:myonlinedoctorweb/widgets/info_cita_agendada_card.dart';
import '../../constants/style.dart';
import '../../widgets/custom_text.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = ScreenSize.screenSize(context);
    final GetAppoimentMock test = GetAppoimentMock();

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
        child: Row(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  flex: 20,
                  child: Container(
                    padding:
                        const EdgeInsets.only(right: 260, left: 260, top: 30),
                    child: const CustomText(
                      text: 'Mis Pacientes',
                      size: 30,
                      weight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
          Expanded(
              child: Column(
            children: [
              Container(
                  padding:
                      const EdgeInsets.only(right: 195, left: 195, top: 30),
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
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          print(snapshot.data);

                          return listToDayAppoimentCard(
                              context, snapshot.data as List<Cita1>, width);
                        }
                      })),
            ],
          ))
        ]));
  }
}

Widget listToDayAppoimentCard(
    BuildContext context, List<Cita1> citas, double width) {
  // ScheduledAppoiment storedAppoiment = ScheduledAppoiment();

  return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: citas.length,
      itemBuilder: ((context, index) {
        return Container(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
            child: CitaAgendadaCard(
              cita: citas[index],
              topColor: const Color(0xFF0FAB98),
            ));
      }));
}
