import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_ecommerce/controller/home_controller.dart';
import 'package:kriminal_fashion_ecommerce/model/super_category.dart';
import 'package:kriminal_fashion_ecommerce/utils/validations.dart';
import 'package:kriminal_fashion_ecommerce/widgets/custom_drop_down_menu.dart';
import 'package:kriminal_fashion_ecommerce/widgets/primary_button.dart';

import '../model/product_category.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});

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
                  // Todo : on selecting category, only product category under this categories can be selected in the product dropdown
                  CustomDropDownMenu(
                    items: superCategoriesList,
                    hintText: 'Category',
                    onChanged: (value) {
                      homeController.selectedSuperCategory.value = value ?? homeController.selectedSuperCategory.value;
                    },
                    validator: Validations.isEmptyDropDownValidator,
                  ),
                  const SizedBox(height: 10),
                  CustomDropDownMenu(
                    // items: homeController.productCategories.map((category) => category.name! == homeController.selectedSuperCategory).toList(),
                    items: getFilteredProductListForDropdown(
                        homeController.productCategories, homeController.selectedSuperCategory.value),
                    hintText: 'Product Category',
                    onChanged: (value) {
                      homeController.prodCategory.value = value ?? homeController.prodCategory.value;
                    },
                    validator: Validations.isEmptyDropDownValidator,
                  ),
                  // const SizedBox(height: 10),
                  // CustomDropDownMenu(
                  //   items: const ['true', 'false'],
                  //   onChanged: (selectedValue) {
                  //     homeController.prodOffer = bool.tryParse(selectedValue ?? 'false') ?? homeController.prodOffer;
                  //   },
                  //   hintText: 'Offer',
                  //   validator: Validations.isEmptyDropDownValidator,
                  // ),
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

// sort out and return a list of product categories that belong to a specific  super category
List<ProductCategory> filterProductCategoryBySuperCategory(
    SuperCategory superCategory, List<ProductCategory> allProductCategories) {
  return allProductCategories.where((productCategory) => productCategory.superCategoryName == superCategory).toList();
}

// convert ProductCategory list to string list to get names only
List<String> productCategoryListToStringList(List<ProductCategory> productCategories) {
  return productCategories.map((productCategory) => productCategory.name).toList();
}

List<String> getFilteredProductListForDropdown(
    List<ProductCategory> allProductCategories, String selectedSuperCategory) {
  if (selectedSuperCategory.isNotEmpty) {
    final superCategory = stringToSuperCategory(selectedSuperCategory);
    return productCategoryListToStringList(filterProductCategoryBySuperCategory(superCategory, allProductCategories));
  }
  return [];
}
