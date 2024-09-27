import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_ecommerce/controller/home_controller.dart';
import 'package:kriminal_fashion_ecommerce/model/super_category.dart';
import 'package:kriminal_fashion_ecommerce/utils/validations.dart';
import 'package:kriminal_fashion_ecommerce/widgets/custom_drop_down_menu.dart';
import 'package:kriminal_fashion_ecommerce/widgets/primary_button.dart';

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
      body: SingleChildScrollView(
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
                  decoration: const InputDecoration(label: Text('Product Price'), hintText: 'Enter your product price'),
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
                  onChanged: (value) {},
                  validator: Validations.isEmptyDropDownValidator,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Flexible(
                //       child: CustomDropDownMenu(
                //         // convert to List<String>, category can't be null
                //         items: homeController.productCategories.map((category) => category.name!).toList(),
                //         onSelected: (selectedValue) {
                //           homeController.prodCategory = selectedValue ?? homeController.prodCategory;
                //         },
                //         hintText: 'Category',
                //       ),
                //     ),
                //     Flexible(
                //       child: CustomDropDownMenu(
                //
                //         items: const [
                //           'Unbranded',
                //           'Zara',
                //           'Forever 21',
                //           'Snitch',
                //           'Rare Rabbit',
                //           'Only',
                //           'Vera Moda',
                //           'Van Heusan',
                //           'Peter England',
                //           'Allen Solly',
                //           'Domyos',
                //           'Kipsta',
                //           'Puma',
                //           'Sketchers',
                //           'Adidas',
                //           'Clarks',
                //         ],
                //         onSelected: (selectedValue) {
                //           homeController.prodBrand = selectedValue ?? homeController.prodBrand;
                //         },
                //         hintText: 'Brand',
                //       ),
                //     )
                //   ],
                // ),
                const SizedBox(height: 10),
                CustomDropDownMenu(
                  items: homeController.productCategories.map((category) => category.name!).toList(),
                  hintText: 'Product Category',
                  onChanged: (value) {
                    homeController.prodCategory = value ?? homeController.prodCategory;
                  },
                  validator: Validations.isEmptyDropDownValidator,
                ),
                const SizedBox(height: 10),
                CustomDropDownMenu(
                  items: const ['true', 'false'],
                  onChanged: (selectedValue) {
                    homeController.prodOffer = bool.tryParse(selectedValue ?? 'false') ?? homeController.prodOffer;
                  },
                  hintText: 'Offer',
                  validator: Validations.isEmptyDropDownValidator,
                ),
                const SizedBox(height: 10),
                PrimaryButton(text: 'ADD PRODUCT'),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.theme.colorScheme.secondary,
                      foregroundColor: context.theme.colorScheme.inversePrimary,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        homeController.addProduct();
                      }

                      // await Future.delayed(const Duration(milliseconds: 2000));
                      // Get.back(); dont work
                      // Get.until((route) => Get.currentRoute == '/');
                    },
                    child: const Text('Add Product')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
