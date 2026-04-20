class Product {
  final int id;
  final String name;
  final String image;
  final bool isAsset;
  final double price;
  final double rating;
  final int categoryId;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.image,
    this.isAsset = false,
    required this.price,
    required this.rating,
    required this.categoryId,
    this.isFavorite = false,
  });
}