import 'package:flutter/material.dart';

import 'package:myonlinedoctorweb/widgets/custom_text.dart';

import '../../constants/style.dart';

class HistoriaMedicaForm extends StatefulWidget {
  const HistoriaMedicaForm({Key? key}) : super(key: key);

  @override
  State<HistoriaMedicaForm> createState() => HistoriaMedicaFormState();
}

class HistoriaMedicaFormState extends State<HistoriaMedicaForm> {
  final formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  String? prescripcion;
  String? historia;
  String? diagnostico;
  String? plan;
  String? examenes;
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
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  children: [
                    Container(
                      width: 170,
                      padding: const EdgeInsets.only(
                        left: 35,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: CustomText(
                          text: 'Fecha',
                          size: 20,
                          weight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                        width: 200,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: myController,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                          decoration: InputDecoration(
                              hintText: 'Fecha de la Consulta',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(5)),
                              fillColor: Colors.white,
                              filled: true),
                        )),
                    Container(
                      width: 170,
                      padding: const EdgeInsets.only(left: 20),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: CustomText(
                          text: 'Motivo',
                          size: 20,
                          weight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                        width: 500,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                          decoration: InputDecoration(
                              hintText: 'Motivo de la Consulta',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(5)),
                              fillColor: Colors.white,
                              filled: true),
                        ))
                  ],
                ),
              ),
              const Divider(height: 20, color: Colors.transparent),
              Row(
                children: [
                  Container(
                    width: 170,
                    padding: const EdgeInsets.only(left: 35, right: 15),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: CustomText(
                        text: 'Doctor',
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
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                        decoration: InputDecoration(
                            hintText: 'Nombre del Doctor',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5)),
                            fillColor: Colors.white,
                            filled: true),
                      )),
                ],
              ),
              const Divider(
                height: 20,
                color: Colors.transparent,
              ),
              Row(
                children: [
                  Container(
                    width: 170,
                    padding: const EdgeInsets.only(left: 35),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: CustomText(
                        text: 'Paciente',
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
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                        decoration: InputDecoration(
                            hintText: 'Nombre del Paciente',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5)),
                            fillColor: Colors.white,
                            filled: true),
                      )),
                ],
              ),
              const Divider(height: 20, color: Colors.transparent),
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
                        diagnostico = value;
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
                        plan = value;
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
                        historia = value;
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
                        examenes = value;
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
                              prescripcion = value;
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
              FloatingActionButton(
                // When the user presses the button, show an alert dialog containing
                // the text that the user has entered into the text field.
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text that the user has entered by using the
                        // TextEditingController.
                        content: Text(myController.text),
                      );
                    },
                  );
                },
                tooltip: 'Show me the value!',
                child: const Icon(Icons.text_fields),
              )
            ],
          ),
        ),
      ),
    );
  }
}
