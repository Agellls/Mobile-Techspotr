import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/routes/app_pages.dart';
import 'package:flutter_application_1/routes/routes_name.dart';

void main() {
  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set status bar color to transparent
      statusBarIconBrightness:
          Brightness.light, // Set status bar icons to light
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        // Avoid using primarySwatch or primaryColor
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: activeColor,
          secondary: Colors.teal,
          surface: Colors.white,
          onPrimary: Colors.white,
          onSurface: Colors.black87,
        ),
      ),
      getPages: AppPages.pages,
      initialRoute: RouteName.defaults,
    );
  }
}
