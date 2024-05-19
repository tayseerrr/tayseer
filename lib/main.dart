import 'package:application/controllers/navigation.dart';
import 'package:flutter/material.dart';

import 'core/app.dart';
import 'core/initilzer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // root@root.com



  await Initializer.instance.init();

  String firstRoute = await NavigationController.instance.firstRoute();
  runApp(TayseerApp(
    firstRoute: firstRoute,
  ));
}
