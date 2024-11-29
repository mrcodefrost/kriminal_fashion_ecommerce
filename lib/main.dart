import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_ecommerce/firebase_options.dart';
import 'package:kriminal_fashion_ecommerce/themes/theme_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/home_controller.dart';
import 'feature/product/presentation/screens/home_screen.dart';
import 'themes/dark_mode.dart';
import 'themes/light_mode.dart';

void main() async {
  runApp(const MyApp());
}

Future<void> _setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  // always place Firebase.initializeApp first after ensureInitialized
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Get.put(prefs);
  Get.put(HomeController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final prefs = Get.find<SharedPreferences>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'K R I M I N A L',
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: ThemeController.prefThemeMode(),

      // themeMode: ThemeMode.system,
      // themeMode: ThemeMode.dark, // does not allow change in theme, why?
      // themeMode: ThemeMode.light,
      // if you don't add this line then it doesn't work on web deployment. android ?
      home: HomeScreen(),
      // home: TestScreen(),
    );
  }
}
