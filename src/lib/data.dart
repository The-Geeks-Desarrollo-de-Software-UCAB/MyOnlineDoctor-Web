import 'dart:convert';

import 'package:myonlinedoctorweb/Modules/doctor.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;


String id_doctor = "";
//String id_doctor2 = '1cffbf21-857b-4d09-bded-29537338c6f7';
//String id_paciente = "e49421aa-6508-4902-aec2-75d519299bb5";

String nombre_doctor ='';
String apellido_doctor ='';


//COLOQUEN SU IP PARA HACER LOS REQUEST
String ip = "";


class SetValores{

  static  SetValoresDoctor(String user) async{

    final ruta = 'https://myonlinedoctorapi.herokuapp.com/api/doctor/porusuario' + user;

    final response = await http.get(Uri.parse(ruta));
    final resultado = json.decode(response.body);

    id_doctor = resultado[0]['doctor']['_id']['_id'];
    nombre_doctor =resultado[0]['doctor']['_nombre']['_primerNombre'];

    apellido_doctor = resultado[0]['doctor']['_apellido']['_primerApellido'];

    
  }


}