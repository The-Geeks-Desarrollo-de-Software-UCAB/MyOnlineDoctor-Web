import 'package:flutter/material.dart';
import 'package:myonlinedoctorweb/Modules/cita.dart';
import 'package:myonlinedoctorweb/constants/screen_size.dart';
import 'package:myonlinedoctorweb/service.dart/get_appoiments.dart';
import 'package:myonlinedoctorweb/widgets/info_cards.dart';

class ScheduleAppoimentLargeScreen extends StatefulWidget {
  const ScheduleAppoimentLargeScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleAppoimentLargeScreen> createState() =>
      _ScheduleAppoimentLargeScreenState();
}

class _ScheduleAppoimentLargeScreenState
    extends State<ScheduleAppoimentLargeScreen> {
  @override
  Widget build(BuildContext context) {
    final _width = ScreenSize.screenSize(context);
    //final GetAppoimentMock test = GetAppoimentMock();

    return FutureBuilder(
        future: Cita.fetchCitasSolicitadas(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return listScheduleAppoimentCard(
                context, snapshot.data as List<Cita>, _width);
          } else if (snapshot.hasError) {
            return Text("ERROR");
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}

Widget listScheduleAppoimentCard(
    BuildContext context, List<Cita> citas, double width) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: citas.length,
      itemBuilder: ((context, index) {
        return Container(
            padding: const EdgeInsets.only(
                left: 300, right: 300, top: 30, bottom: 30),
            child: CitaCard(
              cita: citas[index],
              topColor: const Color(0xFF0FAB98),
            ));
      }));
}
