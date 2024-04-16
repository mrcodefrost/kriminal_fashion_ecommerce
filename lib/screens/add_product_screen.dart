import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_ecommerce/controller/home_controller.dart';
import 'package:kriminal_fashion_ecommerce/widgets/custom_drop_down_menu.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});

  final HomeController homeController = Get.find<HomeController>();

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Add new product'),
              TextField(
                controller: homeController.prodNameController,
                decoration: const InputDecoration(
                    label: Text('Product Name'),
                    hintText: 'Enter your product here'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: homeController.prodDescriptionController,
                decoration: const InputDecoration(
                    label: Text('Product Description'),
                    hintText: 'Enter your product description'),
                maxLines: 4,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: homeController.prodImageController,
                decoration: const InputDecoration(
                    label: Text('Image URL'), hintText: 'Enter your image url'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: homeController.prodPriceController,
                decoration: const InputDecoration(
                    label: Text('Product Price'),
                    hintText: 'Enter your product price'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: homeController.prodShortTagController,
                decoration: const InputDecoration(
                    label: Text('Short Tag'),
                    hintText: 'Enter your product short tag ID'),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: CustomDropDownMenu(
                      // convert to List<String>, category can't be null
                      items: homeController.productCategories
                          .map((category) => category.name!)
                          .toList(),
                      onSelected: (selectedValue) {
                        homeController.prodCategory =
                            selectedValue ?? homeController.prodCategory;
                      },
                      hintText: 'Category',
                    ),
                  ),
                  Flexible(
                    child: CustomDropDownMenu(
                      // TODO make dynamic
                      items: const [
                        'Unbranded',
                        'Zara',
                        'Forever 21',
                        'Snitch',
                        'Rare Rabbit',
                        'Only',
                        'Vera Moda',
                        'Van Heusan',
                        'Peter England',
                        'Allen Solly',
                        'Domyos',
                        'Kipsta',
                        'Puma',
                        'Sketchers',
                        'Adidas',
                        'Clarks',
                      ],
                      onSelected: (selectedValue) {
                        homeController.prodBrand =
                            selectedValue ?? homeController.prodBrand;
                      },
                      hintText: 'Brand',
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Offer Product?'),
              CustomDropDownMenu(
                items: const ['true', 'false'],
                onSelected: (selectedValue) {
                  homeController.prodOffer =
                      bool.tryParse(selectedValue ?? 'false') ??
                          homeController.prodOffer;
                },
                hintText: 'Offer?',
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
                    homeController.addProduct();
                    // await Future.delayed(const Duration(milliseconds: 2000));
                    // Get.back(); dont work
                    // Get.until((route) => Get.currentRoute == '/');
                  },
                  child: const Text('Add Product')),
            ],
          ),
        ),
      ),
    );
  }
}
