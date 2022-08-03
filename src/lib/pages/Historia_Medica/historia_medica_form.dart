import 'package:flutter/material.dart';
import 'package:myonlinedoctorweb/Modules/cita.dart';
import 'package:myonlinedoctorweb/Modules/historia_medica.dart';
import 'package:myonlinedoctorweb/service.dart/post_appoiments.dart';

import 'package:myonlinedoctorweb/widgets/custom_text.dart';

import '../../constants/style.dart';

class HistoriaMedicaForm extends StatefulWidget {
  Cita cita;

  HistoriaMedicaForm({Key? key, required this.cita}) : super(key: key);

  @override
  State<HistoriaMedicaForm> createState() => HistoriaMedicaFormState();
}

class HistoriaMedicaFormState extends State<HistoriaMedicaForm> {
  final formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  String prescripcion = '';
  String historia = '';
  String diagnostico = '';
  String plan = '';
  String examenes = '';
  DateTime? fecha;
  // el motivo se pasa utomaticamente
  // la fecha se pudiera pasar automaticamnte
  // Doctor se deberia pasar automaticamente

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

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
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    right: 260, left: 260, top: 30, bottom: 40),
                child: const CustomText(
                  text: 'Resgistro Historia Medica',
                  size: 30,
                  weight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Divider(height: 40, color: Colors.transparent),
              Row(children: [
                Container(
                  width: 200,
                  padding: const EdgeInsets.only(left: 35),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: CustomText(
                      text: 'Diagnostico',
                      size: 20,
                      weight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  child: TextFormField(
                    onSaved: (value) {
                      setState(() {
                        diagnostico = value ?? "";
                      });
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'Diagnostico del paciente',
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
                Container(
                  width: 170,
                  padding: const EdgeInsets.only(left: 35, right: 20),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: CustomText(
                      text: 'Plan',
                      size: 20,
                      weight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  child: TextFormField(
                    onSaved: (value) {
                      setState(() {
                        plan = value ?? '';
                      });
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'Plan',
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
              ]),
              const Divider(height: 20, color: Colors.transparent),
              Row(children: [
                Container(
                  width: 200,
                  padding: const EdgeInsets.only(
                    left: 35,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: CustomText(
                      text: 'Historia',
                      size: 20,
                      weight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  child: TextFormField(
                    onSaved: (value) {
                      setState(() {
                        historia = value ?? '';
                      });
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'Historia del paciente',
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
                Container(
                  width: 170,
                  padding: const EdgeInsets.only(left: 35, right: 20),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 19),
                    child: CustomText(
                      text: 'Examenes',
                      size: 20,
                      weight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  child: TextFormField(
                    onSaved: (value) {
                      setState(() {
                        examenes = value ?? "";
                      });
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'Examenes a realizar',
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
              ]),
              const Divider(height: 20, color: Colors.transparent),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  children: [
                    Container(
                      width: 170,
                      padding: const EdgeInsets.only(left: 35),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CustomText(
                          text: 'Prescripcion',
                          size: 20,
                          weight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                        width: 900,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          onSaved: (value) {
                            setState(() {
                              prescripcion = value ?? '';
                            });
                          },
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Prescripcion del Doctor',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5)),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                width: 200,
                height: 80,
                padding: const EdgeInsets.only(bottom: 40),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green)),
                  onPressed: () {
                    formKey.currentState?.save();
                    final historiaMedica = HistoriaMedica(
                      diagnostico: diagnostico,
                      examenes: examenes,
                      historia: historia,
                      plan: plan,
                      prescripcion: prescripcion,
                    );
                    // Falta generar id de rsgistro
                    PostHistoriaMedica.crearHistoriaMedica(
                        widget.cita, historiaMedica);
                  },
                  child: const Center(
                    child: CustomText(
                      text: 'Guardar',
                      size: 16,
                      weight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
