import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myonlinedoctorweb/Modules/doctor.dart';
import 'package:myonlinedoctorweb/Modules/especialidades.dart';
import 'package:myonlinedoctorweb/constants/style.dart';
import 'package:myonlinedoctorweb/pages/Lista_Doctores/doctorSearchDelegate.dart';
import 'package:myonlinedoctorweb/pages/Lista_Doctores/listadoDoctores.dart';
import 'package:myonlinedoctorweb/service.dart/especialidadesProvider.dart';
import 'package:provider/provider.dart';

class ListaDoctores extends StatefulWidget {
  const ListaDoctores({Key? key}) : super(key: key);

  @override
  State<ListaDoctores> createState() => _ListaDoctoresState();
}

class _ListaDoctoresState extends State<ListaDoctores> {
  String opcionPorDefecto = 'Especialidad';
  String? especialidad = '';
  String? e = '';
  String? id_especialidad = '';
  @override
  Widget build(BuildContext context) {
    final especialidadesProvider = Provider.of<EspecialidadesProvider>(context);
    final items = especialidadesProvider.especialidadesDisponibles;

    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: <Color>[
                  AppColors.MAINCOLOR1,
                  AppColors.MAINCOLOR2
                ])),
          ),
          title: Text(
            'Doctores',
            style: TextStyle(color: AppColors.WHITE),
          ),
          /*actions: [
            DropdownButton<Especialidades>(
                items: items
                    .map<DropdownMenuItem<Especialidades>>((Especialidades a) {
                  return DropdownMenuItem<Especialidades>(
                    value: a,
                    child: Text(a.nombre),
                  );
                }).toList(),
                onChanged: (Especialidades? a) => setState(() {
                      if (a?.nombre == '...') {
                        especialidad = '';
                        e = '';
                        opcionPorDefecto = 'Especialidad';
                        id_especialidad = '';
                      } else {
                        e = 'e/';
                        especialidad = a?.nombre;
                        id_especialidad = a?.id.toString();
                        opcionPorDefecto = especialidad!;
                      }
                    }),
                hint: Text(opcionPorDefecto)),
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: DoctorSearchDelegate()),
                icon: Icon(Icons.search_outlined)),
          ],*/
        ),
        body:

            // ListaDoctores([
            //   Doctor(
            //       id: 1,
            //       nombre: 'David',
            //       apellido: 'Rey',
            //       genero: 'M',
            //       imagen: 'https://i.ibb.co/KbQL38r/hombre5.jpg',
            //       especialidades: [
            //         Especialidades(id: 1, nombre: 'Cardiologia'),
            //         Especialidades(id: 2, nombre: 'Traumatologia')
            //       ],
            //       calificaciones: [
            //         4.0
            //       ]),
            //   Doctor(
            //       id: 2,
            //       nombre: 'Carla',
            //       apellido: 'Cepeda',
            //       genero: 'F',
            //       imagen: 'https://i.ibb.co/fN9c7QF/mujer11.jpg',
            //       especialidades: [
            //         Especialidades(id: 1, nombre: 'Cardiologia'),
            //         Especialidades(id: 2, nombre: 'Traumatologia')
            //       ],
            //       calificaciones: [
            //         3.0,
            //         4.0
            //       ])
            // ])

            FutureBuilder(
                future: Doctor.fetchDoctores(id_especialidad!),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    //return ListaDoctores([Doctor(id: 1, nombre: 'David', apellido: 'Rey', genero: 'M', imagen:'https://images.unsplash.com/photo-1658140917228-129162d2a5b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80' , especialidades: [Especialidades(id: 1, nombre: 'Cardiologia'), Especialidades(id: 2, nombre: 'Traumatologia')])]);

                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListadoDoctores(snapshot.data);
                  }
                }));
  }
}
