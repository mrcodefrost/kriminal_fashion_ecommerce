import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_ecommerce/feature/product/data/models/product.dart';
import 'package:kriminal_fashion_ecommerce/feature/category/data/models/product_category.dart';

import '../utils/utils.dart';

class HomeController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference productCollection;
  late CollectionReference categoryCollection;

  TextEditingController prodNameController = TextEditingController();
  TextEditingController prodDescriptionController = TextEditingController();
  TextEditingController prodImageController = TextEditingController();
  TextEditingController prodPriceController = TextEditingController();
  TextEditingController prodShortTagController = TextEditingController();

  // Category Controller
  TextEditingController categoryNameController = TextEditingController();

  RxString prodCategory = ''.obs;

  RxBool prodOffer = false.obs;
  RxString prodShortTag = 'No Tag'.obs;
  RxString selectedSuperCategory = ''.obs;

  RxList<Product> products = <Product>[].obs;
  RxList<ProductCategory> productCategories = <ProductCategory>[].obs;

  @override
  void onInit() async {
    super.onInit();
    productCollection = firebaseFirestore.collection('products');
    categoryCollection = firebaseFirestore.collection('categories');
    await fetchProducts();
    await fetchCategories();
  }

  // Products CRUD

  void addProduct() {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
        id: doc.id,
        name: prodNameController.text,
        superCategory: selectedSuperCategory.value,
        category: prodCategory.value,
        description: prodDescriptionController.text,
        price: double.tryParse(prodPriceController.text) ?? 0.0,
        image: prodImageController.text,
        shortTag: prodShortTagController.text,
      );

      final productJson = product.toJson();
      doc.set(productJson); // code to add to entry to firebase collection

      Get.snackbar('Success', 'Product added successfully', colorText: Colors.green);
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
      final List<Product> retrievedProducts =
          productSnapshot.docs.map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
      // clearing the local list to avoid multiple entries
      products.clear();
      products.assignAll(retrievedProducts);
      Get.snackbar('Success', 'Product list updated successfully', colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      logg.e(e.toString(), error: 'fetchProducts() error');
    } finally {
      // super important - always call update() in such cases of statelessness
      update();
    }
  }

  void updateProduct(String productId) async {
    try {
      // Get a reference to the existing document by using its ID
      DocumentReference docRef = productCollection.doc(productId);

      // Create a Product object with the updated values
      Product updatedProduct = Product(
        id: productId,
        name: prodNameController.text, // Update name from controller
        superCategory: selectedSuperCategory.value, // Updated super category
        category: prodCategory.value, // Updated category
        description: prodDescriptionController.text, // Updated description
        price: double.tryParse(prodPriceController.text) ?? 0.0, // Updated price
        image: prodImageController.text, // Updated image URL
        shortTag: prodShortTagController.text, // Updated short tag
      );

      // Convert the Product object to a JSON format
      final productJson = updatedProduct.toJson();

      // Update the document in Firestore
      await docRef.update(productJson);

      // Show a success message
      Get.snackbar('Success', 'Product updated successfully', colorText: Colors.green);
      resetFieldsToDefault();
    } catch (e) {
      // Show an error message if something goes wrong
      Get.snackbar('Error', 'Failed to update product: ${e.toString()}', colorText: Colors.red);
      logg.e(e.toString(), error: 'updateProduct() error');
    } finally {
      // Update the UI if necessary
      update();
    }
  }

  void deleteProduct(String id) async {
    try {
      productCollection.doc(id).delete();
      await fetchProducts();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      logg.e(e.toString(), error: 'deleteProduct() error');
    }
  }

  void resetFieldsToDefault() {
    prodNameController.clear();
    prodPriceController.clear();
    prodDescriptionController.clear();
    prodImageController.clear();
    prodCategory.value = '';
    prodOffer.value = false;
    prodShortTagController.clear();
    // in cases of menus always call
    update();
  }

  // Categories CRUD

  void addCategory() {
    try {
      DocumentReference doc = categoryCollection.doc();
      ProductCategory productCategory = ProductCategory(
        id: doc.id,
        name: categoryNameController.text,
        superCategory: selectedSuperCategory.value,
      );

      final productCategoryJson = productCategory.toJson();
      doc.set(productCategoryJson); // code to add to entry to firebase collection

      Get.snackbar('Success', 'Category added successfully', colorText: Colors.green);
      categoryNameController.clear();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      logg.e(e.toString(), error: 'addCategory() error');
    } finally {
      update();
    }
  }

  Future<void> fetchCategories() async {
    try {
      QuerySnapshot categorySnapshot = await categoryCollection.get();
      final List<ProductCategory> retrievedCategories =
          categorySnapshot.docs.map((doc) => ProductCategory.fromJson(doc.data() as Map<String, dynamic>)).toList();
      // clearing the local list to avoid multiple entries
      productCategories.clear();
      productCategories.assignAll(retrievedCategories);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      logg.e(e.toString(), error: 'fetchCategories() error');
    } finally {
      // super important - always call update() in such cases of statelessness
      update();
    }
  }

  void deleteCategory(String id) async {
    try {
      categoryCollection.doc(id).delete();
      await fetchCategories();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      logg.e(e.toString(), error: 'deleteCategory() error');
    }
  }
}
