import 'package:http/http.dart' as http;
import 'package:myonlinedoctorweb/Modules/cita.dart';

const appID = "9670763b32664cbba37968ca7c7ab6d8";
const token =
    "0069670763b32664cbba37968ca7c7ab6d8IADTqDQmdBcBYjs+WGdl/P46lKPIaZ9/0wgkimmXHwOoy/NBbbUAAAAAEABsSV6Ns4naYgEAAQCyidpi";

const channel = "testvicente";

//const token2 = getToken().then((value) => (value));
// corregir token
Future<String?> getToken() async {
  final response = await http.get(Uri.parse(
      "https://myonlinedoctorapi.herokuapp.com/api/videollamada/citaporid"));

  print(response.body);
  if (response.statusCode == 200) {
    String result = response.body;
    return result;
  }
}
