import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:myonlinedoctorweb/Modules/cita.dart';

class PutScheduledAppoiment {
  static putScheduledAppoiment(Cita cita, String id_doctor) async {
    final response = await http
        .put(Uri.parse('http://localhost:3000/api/cita/Agendar'), body: {
      "id_cita": cita.idCita,
      "fecha": DateTime.now().toString(),
      "id_doctor": id_doctor
    });
    print(response.body);
  }

  static putAceptada(Cita cita, String id_doctor) async {
    final response = await http
        .put(Uri.parse('http://localhost:3000/api/cita/AceptarFecha'), body: {
      "id_cita": cita.idCita,
      "id_paciente": "38a6fe45-68ba-4ca5-89da-0783928974ea",
    });
    print(response.body);
  }
}




// Put cuando se rechaza una cita.
