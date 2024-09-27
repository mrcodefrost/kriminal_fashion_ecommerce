class Product {
  String? id;
  String? name;
  String? description;
  String? category;
  String? image;
  double? price;
  String? brand;
  bool? offer;
  String? shortTag;

  Product({
    this.id,
    this.name,
    this.description,
    this.category,
    this.image,
    this.offer,
    this.price,
    this.brand,
    this.shortTag,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        category: json['category'],
        image: json['image'],
        offer: json['offer'],
        // firebase stores field as number, To avoid issues handle conversion for int to double like below
        price: (json['price'] is int) ? (json['price'] as int).toDouble() : json['price'],
        brand: json['brand'],
        shortTag: json['shortTag'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'category': category,
        'image': image,
        'offer': offer,
        'price': price,
        'brand': brand,
        'shortTag': shortTag,
      };
}
