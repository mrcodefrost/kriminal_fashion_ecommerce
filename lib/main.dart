import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_ecommerce/firebase_options.dart';

import 'screens/home_screen.dart';
import 'themes/dark_mode.dart';
import 'themes/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'K R I M I N A L',
      theme: lightMode,
      darkTheme: darkMode,
      // themeMode: ThemeMode.system,
      // themeMode: ThemeMode.dark, // does not allow change in theme, why?
      // themeMode: ThemeMode.light,
      // if you don't add this line then it doesn't work on web deployment. android ?
      home: HomeScreen(),
      // home: TestScreen(),
    );
  }
}
