import 'package:flutter/material.dart';
import 'package:myonlinedoctorweb/Modules/doctor.dart';
import 'package:myonlinedoctorweb/constants/style.dart';
import 'package:provider/provider.dart';

class DetallesDoctor extends StatelessWidget {
  Doctor doctor;
  DetallesDoctor({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      CustomAppBar(),
      SliverList(
          delegate: SliverChildListDelegate([
        FotoNombre(doctor: doctor),
      ]))
    ]));
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 150,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            'My Online Doctor',
            textAlign: TextAlign.center,
          ),
          background: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: <Color>[
                  AppColors.MAINCOLOR1,
                  AppColors.MAINCOLOR2
                ])),
          )),
    );
  }
}

class FotoNombre extends StatelessWidget {
  Doctor doctor;
  FotoNombre({Key? key, required this.doctor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String generoDr;
    if (doctor.genero == 'M') {
      generoDr = 'Dr. ';
    } else {
      generoDr = 'Dra. ';
    }
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                  height: 400,
                  width: 400,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      placeholder: NetworkImage(
                          'https://images.unsplash.com/photo-1588421357574-87938a86fa28?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
                      image: NetworkImage(this.doctor.imagen),
                    ),
                  ))),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  generoDr +
                      ' ' +
                      this.doctor.nombre +
                      ' ' +
                      this.doctor.apellido,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 50,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 10),
              //Text('Especialidad: ', style: TextStyle(fontSize: 15), textAlign: TextAlign.left),
              Text(this.doctor.getEspecialidadesToString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  )),
              SizedBox(height: 20),
              Text('Calificacion Promedio',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
