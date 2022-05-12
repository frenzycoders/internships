import 'package:employee/bindings/index.dart';
import 'package:employee/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      debugShowCheckedModeBanner: false,
      title: CustomThemes.appName,
      theme: CustomThemes.lightTheme,
      getPages: RouteManager.getRoutes,
      initialRoute: '/splash',
    );
  }
}
