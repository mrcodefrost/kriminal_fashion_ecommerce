import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_ecommerce/controller/home_controller.dart';
import 'package:kriminal_fashion_ecommerce/utils/validations.dart';
import 'package:kriminal_fashion_ecommerce/feature/common/presentation/widgets/custom_drop_down_menu.dart';

import '../../../category/data/models/super_category.dart';
import '../../../common/presentation/widgets/primary_button.dart';
import '../../domain/usecase/product_usecases.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final HomeController homeController = Get.find<HomeController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            width: double.maxFinite,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: homeController.prodNameController,
                    decoration: const InputDecoration(label: Text('Product Name'), hintText: 'Enter your product here'),
                    validator: Validations.isEmptyValidator,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: homeController.prodDescriptionController,
                    decoration: const InputDecoration(
                        label: Text('Product Description'), hintText: 'Enter your product description'),
                    maxLines: 4,
                    validator: Validations.isEmptyValidator,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: homeController.prodImageController,
                    decoration: const InputDecoration(label: Text('Image URL'), hintText: 'Enter your image url'),
                    validator: Validations.isEmptyValidator,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: homeController.prodPriceController,
                    decoration:
                        const InputDecoration(label: Text('Product Price'), hintText: 'Enter your product price'),
                    validator: Validations.isEmptyValidator,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: homeController.prodShortTagController,
                    decoration:
                        const InputDecoration(label: Text('Short Tag'), hintText: 'Enter your product short tag ID'),
                    validator: Validations.isEmptyValidator,
                  ),
                  const SizedBox(height: 10),
                  // On selecting category, only product category under this category can be selected in the product dropdown
                  CustomDropDownMenu(
                    items: superCategoriesList,
                    hintText: 'Category',
                    onChanged: (value) {
                      homeController.selectedSuperCategory.value = value ?? homeController.selectedSuperCategory.value;
                    },
                    validator: Validations.isEmptyDropDownValidator,
                  ),
                  const SizedBox(height: 10),
                  // Only show filtered products based on selected super category
                  CustomDropDownMenu(
                    items: getFilteredProductListForDropdown(
                        homeController.productCategories, homeController.selectedSuperCategory.value),
                    hintText: 'Product Category',
                    onChanged: (value) {
                      homeController.prodCategory.value = value ?? homeController.prodCategory.value;
                    },
                    validator: Validations.isEmptyDropDownValidator,
                  ),
                  const SizedBox(height: 10),
                  PrimaryButton(
                      text: 'ADD PRODUCT',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          homeController.addProduct();
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
