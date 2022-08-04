import 'package:flutter/material.dart';
import 'package:myonlinedoctorweb/Modules/paciente.dart';
import 'package:myonlinedoctorweb/constants/screen_size.dart';
import 'package:myonlinedoctorweb/pages/Dashboard.dart/pacientes_card.dart';
import 'package:myonlinedoctorweb/widgets/custom_text.dart';

import '../../constants/style.dart';

class MisPacientes extends StatelessWidget {
  const MisPacientes({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _width = ScreenSize.screenSize(context);
    final pacientes = Paciente.fetchPacientesPorDoctor();
    return FutureBuilder(
        future: pacientes,
        builder:
            (BuildContext context, AsyncSnapshot<List<Paciente>> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Text("ERROR");
          } else if (snapshot.hasData) {
            print('El snapshot tiene data');
            print(snapshot);
            final List<Paciente> snap = snapshot.data ?? [];
            final cantidadPacientes = snap.length;
            return Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: CustomText(
                      text: 'Cantidad Pacientes: $cantidadPacientes',
                      size: 20,
                      weight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  listPatientsCard(
                      context, snapshot.data as List<Paciente>, _width),
                ],
              ),
            ));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

Widget listPatientsCard(
    BuildContext context, List<Paciente> pacientes, double width) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: pacientes.length,
      itemBuilder: ((context, index) {
        return Container(
          padding:
              const EdgeInsets.only(bottom: 30, left: 50, right: 50, top: 30),
          height: 350,
          width: 80,
          child: PacientesCard(
            paciente: pacientes[index],
          ),
        );
      }));
}
