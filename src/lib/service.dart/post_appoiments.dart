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
      "id_paciente": "fdbf1a1a-be97-4337-a029-f45df5a2e0",
    });
    print(response.body);
  }
}




// Put cuando se rechaza una cita.
