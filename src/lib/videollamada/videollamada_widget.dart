import 'package:flutter/material.dart';
import 'package:myonlinedoctorweb/Modules/cita.dart';
import 'package:myonlinedoctorweb/videollamada/videollamada_state.dart';

class VideoLlamadaWidget extends StatefulWidget {
  Cita cita;

  VideoLlamadaWidget(this.cita, {Key? key}) : super(key: key);

  @override
  VideoLlamadaState createState() => VideoLlamadaState(cita);
}
