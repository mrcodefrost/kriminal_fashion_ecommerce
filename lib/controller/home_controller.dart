import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_ecommerce/model/product.dart';
import 'package:kriminal_fashion_ecommerce/model/product_category.dart';

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

  String prodCategory = '';
  String prodBrand = 'Unbranded';
  bool prodOffer = false;
  String prodShortTag = 'No Tag';

  List<Product> products = [];
  List<ProductCategory> productCategories = [];

  // TODO make product brand
  // List<ProductBrand> productBands = [];

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
        category: prodCategory,
        description: prodDescriptionController.text,
        price: double.tryParse(prodPriceController.text) ?? 0.0,
        // price: productPriceController.text as double,
        brand: prodBrand,
        image: prodImageController.text,
        offer: true,
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
    prodCategory = '';
    prodBrand = '';
    prodOffer = false;
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
      );

      final productCategoryJson = productCategory.toJson();
      doc.set(productCategoryJson); // code to add to entry to firebase collection

      Get.snackbar('Success', 'Category added successfully', colorText: Colors.green);
      categoryNameController.clear();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
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
      print(e.toString());
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
      print(e.toString());
    }
  }
}
