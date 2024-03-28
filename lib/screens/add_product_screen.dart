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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: CustomDropDownMenu(
                      items: const [
                        'General',
                        'Boots',
                        'Shoe',
                        'Beach Shoes',
                        'High heels',
                      ],
                      onSelected: (selectedValue) {
                        homeController.prodCategory =
                            selectedValue ?? 'General';
                      },
                      hintText: 'Category',
                    ),
                  ),
                  Flexible(
                    child: CustomDropDownMenu(
                      items: const [
                        'Unbranded',
                        'Puma',
                        'Sketchers',
                        'Adidas',
                        'Clarks',
                      ],
                      onSelected: (selectedValue) {
                        homeController.prodBrand = selectedValue ?? 'Unbranded';
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
                items: ['true', 'false'],
                onSelected: (selectedValue) {
                  homeController.prodOffer =
                      bool.tryParse(selectedValue ?? 'false') ?? false;
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
                    await Future.delayed(Duration(milliseconds: 2000));
                    // Get.back(); dont work
                    Get.until((route) => Get.currentRoute == '/');
                  },
                  child: const Text('Add Product')),
            ],
          ),
        ),
      ),
    );
  }
}
