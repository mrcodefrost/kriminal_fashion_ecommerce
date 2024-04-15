import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_ecommerce/controller/home_controller.dart';

class AddCategoryScreen extends StatelessWidget {
  AddCategoryScreen({super.key});

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Category'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          width: double.maxFinite,
          child: Column(
            children: [
              const Text('Add new category'),
              TextField(
                controller: homeController.categoryNameController,
                decoration: const InputDecoration(
                    label: Text('Category Name'),
                    hintText: 'Enter your product category here'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    homeController.addCategory();
                  },
                  child: const Text('Add Category')),
            ],
          ),
        ),
      ),
    );
  }
}
