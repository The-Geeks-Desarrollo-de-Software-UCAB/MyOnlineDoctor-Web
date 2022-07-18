import 'package:flutter/widgets.dart';
import 'package:myonlinedoctorweb/routing/router.dart';
import 'package:myonlinedoctorweb/routing/routes.dart';

import '../constants/controllers.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigationKey,
      initialRoute: dashBoardPageRoute,
      onGenerateRoute: generateRoute,
    );
