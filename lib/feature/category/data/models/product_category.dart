import 'package:kriminal_fashion_ecommerce/feature/category/data/models/super_category.dart';

// class SuperCategory {
//   String id;
//   String name;
//
//   SuperCategory({
//     required this.id,
//     required this.name,
//   });
// }

class ProductCategory {
  String id;
  String name;
  // Todo : use super category as string only
  SuperCategory superCategoryName;

  ProductCategory({
    required this.id,
    required this.name,
    required this.superCategoryName,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      id: json['id'],
      name: json['name'],
      superCategoryName: json['superCategoryName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['superCategoryName'] = superCategoryName;
    return data;
  }
}
