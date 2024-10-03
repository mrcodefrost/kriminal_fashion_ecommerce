import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_ecommerce/controller/home_controller.dart';
import 'package:kriminal_fashion_ecommerce/feature/common/presentation/widgets/primary_button.dart';

import '../../../../utils/validations.dart';
import '../../../common/presentation/widgets/custom_drop_down_menu.dart';
import '../../data/models/super_category.dart';

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
              CustomDropDownMenu(
                items: superCategoriesList,
                hintText: 'Category',
                onChanged: (value) {
                  homeController.selectedSuperCategory.value = value ?? homeController.selectedSuperCategory.value;
                },
                validator: Validations.isEmptyDropDownValidator,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: homeController.categoryNameController,
                decoration: const InputDecoration(
                    label: Text('Product category name'), hintText: 'Enter your product category here'),
              ),
              const SizedBox(
                height: 10,
              ),
              PrimaryButton(
                  text: 'Add Category',
                  onPressed: () {
                    homeController.addCategory();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
