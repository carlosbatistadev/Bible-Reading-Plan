import 'package:flutter/material.dart';

// External Packages
import 'package:get/get.dart';

// Screens
import 'screens/manager/manager_screen.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  return runApp(GetMaterialApp(
    title: "Plano de leitura bíblica",
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light().copyWith(
      primaryColor: Color(0xFF550000),
      accentColor: Color(0xFFd40000),
      buttonColor: Color(0xFFd40000),
    ),
    darkTheme: ThemeData.dark().copyWith(
      primaryColor: Color(0xFF550000),
      accentColor: Color(0xFFd40000),
      buttonColor: Color(0xFFd40000),
    ),
    themeMode: ThemeMode.system,
    home: ScreenManager(),
  ));

}
