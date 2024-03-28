import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController {
  static void toggleThemeMode() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }
}
