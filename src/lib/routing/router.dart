import 'package:flutter/material.dart';
import 'package:myonlinedoctorweb/pages/LogOut/logout.dart';
import 'package:myonlinedoctorweb/routing/routes.dart';
import '../pages/Dashboard.dart/dashboard.dart';
import '../pages/Historia_Medica/historia_medica_form.dart';
import '../pages/schedule_appoiment.dart/schedule_appoiment.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case dashBoardPageRoute:
      return _getPageRoute(const DashBoard());

    case scheduledPageRoute:
      return _getPageRoute(const ScheduleAppoiment());

    case historiaMedica:
      return _getPageRoute(const LogOut());

    default:
      return _getPageRoute(const LogOut());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
