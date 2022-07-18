import 'package:flutter/material.dart';
import 'package:myonlinedoctorweb/constants/style.dart';
import 'package:myonlinedoctorweb/widgets/custom_text.dart';
import '../Modules.dart/Cita.dart';
import './custom_text.dart';

class CitaCard extends StatelessWidget {
  final Cita? cita;
  final Color? topColor;
  final bool? isActive;
  final void Function()? onTap;

  const CitaCard(
      {Key? key, this.cita, this.topColor, this.isActive, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
            onTap: onTap,
            child: Container(
                height: 136,
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
                    Expanded(child: Container()),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Paciente: ${cita?.paciente}\n",
                            style: TextStyle(
                                fontSize: 16,
                                color:
                                    isActive ?? false ? active : Colors.black)),
                        TextSpan(
                            text: "Motivo Cita: ${cita?.motivo}\n",
                            style: TextStyle(
                                fontSize: 16,
                                color:
                                    isActive ?? false ? active : Colors.black))
                      ]),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.all(20),
                          child: ElevatedButton(
                              onPressed: () {
                                print('Cita aceptada');
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
                              onPressed: () {},
                              child: const CustomText(
                                  text: "Rechazar",
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
