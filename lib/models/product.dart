class Product {
  final int? id;
  final String title;
  final String description;
  final int? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String>? images;

//<editor-fold desc="Data Methods">
  const Product({
    this.id,
    required this.title,
    required this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    this.images,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          price == other.price &&
          discountPercentage == other.discountPercentage &&
          rating == other.rating &&
          stock == other.stock &&
          brand == other.brand &&
          category == other.category &&
          thumbnail == other.thumbnail &&
          images == other.images);

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      price.hashCode ^
      discountPercentage.hashCode ^
      rating.hashCode ^
      stock.hashCode ^
      brand.hashCode ^
      category.hashCode ^
      thumbnail.hashCode ^
      images.hashCode;

  @override
  String toString() {
    return 'Product{' +
        ' id: $id,' +
        ' title: $title,' +
        ' description: $description,' +
        ' price: $price,' +
        ' discountPercentage: $discountPercentage,' +
        ' rating: $rating,' +
        ' stock: $stock,' +
        ' brand: $brand,' +
        ' category: $category,' +
        ' thumbnail: $thumbnail,' +
        ' images: $images,' +
        '}';
  }

  Product copyWith({
    int? id,
    String? title,
    String? description,
    int? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    String? brand,
    String? category,
    String? thumbnail,
    List<String>? images,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      thumbnail: thumbnail ?? this.thumbnail,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'description': this.description,
      'price': this.price,
      'discountPercentage': this.discountPercentage,
      'rating': this.rating,
      'stock': this.stock,
      'brand': this.brand,
      'category': this.category,
      'thumbnail': this.thumbnail,
      'images': this.images,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      price: map['price'] as int,
      discountPercentage: map['discountPercentage'] as double,
      rating: double.tryParse(map['rating'].toString()) ?? 0,
      stock: map['stock'] as int,
      brand: map['brand'] as String,
      category: map['category'] as String,
      thumbnail: map['thumbnail'] as String,
      images: (map['images'] as List<dynamic>).map((e) => e.toString()).toList(),
    );
  }

  String get discountedPrice {
    var original = price ?? 0;
    var percent = discountPercentage ?? 0;
    var discountValue = original * percent / 100;
    return (original - discountValue).toStringAsFixed(2);
  }

//</editor-fold>
}
