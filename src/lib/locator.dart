import 'package:get_it/get_it.dart';
import 'package:myonlinedoctorweb/videollamada/service/videollamadaservice.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => VideollamadaService());
}
