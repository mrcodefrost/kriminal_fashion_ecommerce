import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_ecommerce/themes/dark_mode.dart';
import 'package:kriminal_fashion_ecommerce/themes/light_mode.dart';

// ENTIRELY USELESS(WRONG) APPROACH

class ThemeControllerGetx extends GetxController {
  // First we create a variable to hold the current theme

  // doesn't work
  // ThemeData themeData = lightMode;
  // wil not work
  Rx<ThemeData> themeData = lightMode.obs;

  // To check if we are in dark mode ( may be required somewhere in UI )
  RxBool get isDarkMode => (themeData.value == darkMode).obs;

  // To switch between modes using button/UI
  // themeData will change but the change is not reflected in the UI
  void toggleTheme() {
    if (themeData.value == lightMode) {
      themeData.value = darkMode;
    } else {
      themeData.value = lightMode;
    }

    print('TOGGLE THEME CALLED');
    // put this in MyApp before @override
    // final ThemeController _themeController = Get.put(ThemeController());
    // in individual screens
    // final ThemeController _themeController = Get.find();

    // You can also save the theme preference in shared preferences or elsewhere.
  }
}
