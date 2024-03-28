import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_ecommerce/model/product.dart';

class HomeController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference productCollection;

  TextEditingController prodNameController = TextEditingController();
  TextEditingController prodDescriptionController = TextEditingController();
  TextEditingController prodImageController = TextEditingController();
  TextEditingController prodPriceController = TextEditingController();

  String prodCategory = 'General';
  String prodBrand = 'Unbranded';
  bool prodOffer = false;

  List<Product> products = [];

  @override
  void onInit() async {
    super.onInit();
    productCollection = firebaseFirestore.collection('products');
    await fetchProducts();
  }

  void addProduct() {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
        id: doc.id,
        name: prodNameController.text,
        category: prodCategory,
        description: prodDescriptionController.text,
        price: double.tryParse(prodPriceController.text),
        // price: productPriceController.text as double,
        brand: prodBrand,
        image: prodImageController.text,
        offer: true,
      );

      final productJson = product.toJson();

      doc.set(productJson);

      Get.snackbar('Success', 'Product added successfully',
          colorText: Colors.green);
      resetFieldsToDefault();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    } finally {
      update();
    }
  }

  Future<void> fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      // clearing the local list to avoid multiple entries
      products.clear();
      products.assignAll(retrievedProducts);
      Get.snackbar('Success', 'Product list updated successfully',
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e.toString());
    } finally {
      // super important - always call update() in such cases of statelessness
      update();
    }
  }

  void deleteProduct(String id) async {
    try {
      productCollection.doc(id).delete();
      await fetchProducts();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e.toString());
    }
  }

  void resetFieldsToDefault() {
    prodNameController.clear();
    prodPriceController.clear();
    prodDescriptionController.clear();
    prodImageController.clear();
    prodCategory = 'General';
    prodBrand = 'Unbranded';
    prodOffer = false;
    // in cases of menus always call
    update();
  }
}
