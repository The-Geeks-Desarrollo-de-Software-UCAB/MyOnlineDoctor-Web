import 'package:flutter/material.dart';
import 'package:myonlinedoctorweb/constants/move_appoiment.dart';
import 'package:myonlinedoctorweb/constants/screen_size.dart';
import 'package:myonlinedoctorweb/constants/style.dart';
import 'package:myonlinedoctorweb/service.dart/post_appoiments.dart';
import 'package:myonlinedoctorweb/widgets/custom_text.dart';
import '../Modules/cita.dart';
import './custom_text.dart';

class CitaCard extends StatelessWidget {
  final Cita cita;
  final Color? topColor;
  final bool? isActive;
  final void Function()? onTap;

  const CitaCard(
      {Key? key, required this.cita, this.topColor, this.isActive, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = ScreenSize.screenSize(context);

    return Dismissible(
      key: ValueKey(cita.idCita),
      direction: DismissDirection.endToStart,
      background: Container(
          color: Colors.red,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          )),
      child: Expanded(
          child: InkWell(
              onTap: onTap,
              child: Container(
                  height: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: light,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 6),
                          color: lightGrey.withOpacity(.1),
                          blurRadius: 12)
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            color: topColor ?? active,
                            height: 5,
                          ))
                        ],
                      ),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.only(bottom: 30),
                      )),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Cita: ${cita.idCita}\n",
                              style: TextStyle(
                                fontSize: 16,
                                color: isActive ?? false ? active : active,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text: "Paciente: ${cita.paciente}\n",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: isActive ?? false ? active : active,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "Motivo Cita: ${cita.motivo}\n",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: isActive ?? false ? active : active,
                                  fontWeight: FontWeight.bold))
                        ]),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            padding: const EdgeInsets.all(20),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.lightGreen),
                                onPressed: () async {
                                  print('Cita aceptada');
                                  await pickDate(context, cita);
                                  await pickTime(context, cita);

                                  //scheduledAppoiments.add(cita);
                                  //PutScheduledAppoiment.putScheduledAppoiment(
                                  //    cita,
                                  //    "088e361d-3ddf-46f4-8059-3406e189e2a9");
                                  PutScheduledAppoiment.putAceptada(cita,
                                      "088e361d-3ddf-46f4-8059-3406e189e2a9");
                                  //mover a citas agendadas
                                  // tengo que enviar informacion al back
                                },
                                child: const CustomText(
                                    text: "Agendar",
                                    color: Colors.white,
                                    size: 12,
                                    weight: FontWeight.bold)),
                          )),
                          Expanded(
                              child: Container(
                            padding: const EdgeInsets.all(20),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.redAccent,
                                ),
                                onPressed: () {
                                  cita.estadoCita = 'RECHAZADA';
                                  print(cita.estadoCita);
                                },
                                child: const CustomText(
                                    text: "Rechazar",
                                    color: Colors.white,
                                    size: 12,
                                    weight: FontWeight.bold)),
                          )),
                        ],
                      )
                    ],
                  )))),
      onDismissed: (_) {
        print('Item Eliminado');
      },
    );
  }
}

Future<DateTime?> pickDate(BuildContext context, Cita cita) async {
  final initialDate = DateTime.now();
  final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5));

  cita.fecha = newDate!;
  if (newDate == null) {
    return null;
  }

  return newDate;
}

Future pickTime(BuildContext context, Cita cita) async {
  final initialTime = TimeOfDay(hour: 9, minute: 0);
  final newTime =
      await showTimePicker(context: context, initialTime: initialTime);

  //cita.time = newTime;

  return newTime;
}
