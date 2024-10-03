import '../../../category/data/models/product_category.dart';
import '../../../category/data/models/super_category.dart';

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
