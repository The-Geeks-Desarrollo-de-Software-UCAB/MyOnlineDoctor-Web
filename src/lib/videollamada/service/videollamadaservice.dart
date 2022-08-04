import 'dart:convert';
import 'package:http/http.dart' as http;

class VideollamadaService {
  getTokenCita(String id_cita) async {
    var request = await http.get(Uri.parse(
        "https://myonlinedoctorapi.herokuapp.com/api/videollamada/CitaPorID" +
            id_cita));
    print(id_cita);
    print(request.body);
    return request.body;
  }
}
