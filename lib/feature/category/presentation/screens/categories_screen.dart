import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_ecommerce/feature/category/presentation/screens/add_category_screen.dart';
import 'package:kriminal_fashion_ecommerce/feature/product/presentation/screens/home_screen.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../../../controller/home_controller.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final homeController = Get.find<HomeController>();

  Future<void> refreshCategoriesList() async {
    await homeController.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Kriminal Fashion Admin'),
          leading: IconButton(
              onPressed: () {
                Get.offAll(HomeScreen());
              },
              icon: const Icon(Icons.arrow_back)),
          actions: [
            IconButton(
                onPressed: () {
                  refreshCategoriesList();
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: LiquidPullToRefresh(
          onRefresh: refreshCategoriesList,
          child: ListView.builder(
              itemCount: homeController.productCategories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(homeController.productCategories[index].name),
                  subtitle: Text((homeController.productCategories[index].id).toString()),
                  trailing: IconButton(
                      onPressed: () {
                        homeController.deleteCategory(homeController.productCategories[index].id);
                      },
                      icon: const Icon(Icons.delete)),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddCategoryScreen());
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
