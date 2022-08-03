import 'package:flutter/material.dart';
import 'package:myonlinedoctorweb/constants/style.dart';
import 'package:myonlinedoctorweb/videollamada/videollamada_widget.dart';
import 'package:myonlinedoctorweb/widgets/custom_text.dart';
import '../Modules/cita.dart';
import './custom_text.dart';

class CitaAgendadaCard extends StatelessWidget {
  final Cita cita;
  final Color? topColor;
  final bool? isActive;
  final void Function()? onTap;

  const CitaAgendadaCard(
      {Key? key, required this.cita, this.topColor, this.isActive, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
            onTap: onTap,
            child: Container(
                height: 170,
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
                            text: "Paciente: ${cita.id_paciente}\n",
                            style: TextStyle(
                                fontSize: 16,
                                color: isActive ?? false ? active : active,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "Motivo Cita: ${cita.motivo}\n",
                            style: TextStyle(
                                fontSize: 16,
                                color: isActive ?? false ? active : active,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "Fecha: ${cita.fecha}\n",
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
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          VideoLlamadaWidget(cita)),
                                );
                                print('iniciar Llamada');
                                // necesito pasarle la llamada
                              },
                              child: const CustomText(
                                  text: "Llamar",
                                  color: Colors.white,
                                  size: 12,
                                  weight: FontWeight.bold)),
                        )),
                      ],
                    )
                  ],
                ))));
  }
}
