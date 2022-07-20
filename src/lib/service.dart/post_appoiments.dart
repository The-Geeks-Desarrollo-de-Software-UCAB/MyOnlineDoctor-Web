import 'package:http/http.dart' as http;
import 'package:myonlinedoctorweb/Modules/cita.dart';

class PostScheduledAppoiment {
  static postScheduledAppoiment(Cita cita) async {
    print('Estoy funcionando');
    final response = await http
        .put(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'), body: {
      "id_cita": cita.id_cita,
      "fecha":
          "${cita.date?.year}-${cita.date?.month}-${cita.date?.day}T${cita.time?.hour}:${cita.time?.minute}:00.000Z",
      "id_doctor": "en proceso"
    });

    print(response.body);
  }
}
