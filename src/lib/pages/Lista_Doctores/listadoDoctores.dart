import 'package:flutter/material.dart';
import 'package:myonlinedoctorweb/Modules/doctor.dart';

class ListadoDoctores extends StatelessWidget {
  final List<Doctor> doctores;

  ListadoDoctores(this.doctores);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: doctores.length,
        itemBuilder: (BuildContext context, int index) {
          final doctor = doctores[index];
          String generoDr;
          if (doctor.genero == 'M') {
            generoDr = 'Dr. ';
          } else {
            generoDr = 'Dra. ';
          }
          return ListTile(
            leading: Container(
                child: CircleAvatar(
              backgroundImage: NetworkImage(doctor.imagen),
              maxRadius: 30,
            )),
            title: Text(
                generoDr + '${doctor.nombre}' + ' ' + '${doctor.apellido}'),
            subtitle: Text(doctor.getEspecialidadesToString()),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
          );
        });
  }
}
