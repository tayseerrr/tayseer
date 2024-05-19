import 'package:application/core/routers.dart';
import 'package:application/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TayseerApp extends StatelessWidget {
  const TayseerApp({super.key,required this.firstRoute});
final String firstRoute;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tayseer App Demo',
      locale: const Locale('ar', 'SA'),
      theme: const MaterialTheme().light(),
      // home:  AdmissionHomeView(),
      initialRoute: firstRoute,
      getPages:routers,
      // initialRoute: firstRoute,
    );
  }
}