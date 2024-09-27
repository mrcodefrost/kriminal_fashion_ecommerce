class ProductCategory {
  String? id;
  String? name;

  ProductCategory({
    this.id,
    this.name,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) => ProductCategory(
        id: json['id'] as String?,
        name: json['name'] as String?,
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
