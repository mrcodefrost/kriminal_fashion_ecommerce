import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_ecommerce/controller/home_controller.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../themes/theme_controller.dart';
import 'add_product_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController = Get.put(HomeController());

  Future<void> refresh() async {
    await homeController.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Kriminal Fashion Admin'),
        ),
        drawer: Drawer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  'Dark Mode',
                ),
                leading: Icon(
                  Icons.nightlight,

                  color: context.theme.colorScheme.inversePrimary, // works
                  // NONE OF THESE WORK
                  // color: themeController.themeData.colorScheme.inversePrimary, // does not work
                  // color: themeController
                  //     .themeData.value.colorScheme.inversePrimary, // does not work either
                  // color: Get.theme.colorScheme.inversePrimary, // does not work - immutable
                ),
                onTap: () {
                  // change theme mode not theme

                  // Get.changeThemeMode(
                  //     Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                  // created a method for it
                  ThemeController.toggleThemeMode();

                  // NONE OF THESE WORK
                  // Get.isDarkMode
                  //     ? Get.changeTheme(lightMode)
                  //     : Get.changeTheme(darkMode);

                  // Get.changeTheme(
                  //     Get.isDarkMode ? lightMode : darkMode);
                  // themeController.toggleTheme(); // does not work
                },
              ),
            ],
          ),
        ),
        body: LiquidPullToRefresh(
          onRefresh: refresh,
          child: ListView.builder(
              itemCount: homeController.products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(homeController.products[index].name ?? ''),
                  subtitle: Text(
                      (homeController.products[index].price ?? 0).toString()),
                  trailing: IconButton(
                      onPressed: () {
                        homeController.deleteProduct(
                            homeController.products[index].id ?? '');
                      },
                      icon: Icon(Icons.delete)),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddProductScreen());
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
