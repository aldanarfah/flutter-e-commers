import '../models/product.dart';

class ProductService {
  static Future<List<Product>> fetchProducts(int page) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      Product(
        id: 1,
        name: "Sepatu Sneakers Pria",
        image: "assets/images/product1.png",
        isAsset: true,
        price: 250000,
        rating: 4.5,
        categoryId: 1, // Sepatu
      ),
      Product(
        id: 2,
        name: "Tas Wanita Elegant",
        image: "assets/images/product2.png",
        isAsset: true,
        price: 180000,
        rating: 4.3,
        categoryId: 2, // Aksesoris
      ),
      Product(
        id: 3,
        name: "Jam Tangan Analog",
        image: "assets/images/product3.png",
        isAsset: true,
        price: 320000,
        rating: 4.6,
        categoryId: 2,
      ),
      Product(
        id: 4,
        name: "Headset Bluetooth",
        image: "assets/images/product4.png",
        isAsset: true,
        price: 150000,
        rating: 4.2,
        categoryId: 2,
      ),
      Product(
        id: 5,
        name: "Kaos Polos Premium",
        image: "assets/images/product5.png",
        isAsset: true,
        price: 90000,
        rating: 4.1,
        categoryId: 3, // Pakaian
      ),
      Product(
        id: 6,
        name: "Celana Jeans Slim Fit",
        image: "assets/images/product6.png",
        isAsset: true,
        price: 200000,
        rating: 4.4,
        categoryId: 3,
      ),
      Product(
        id: 7,
        name: "Sepatu Running Sport",
        image: "assets/images/product7.png",
        isAsset: true,
        price: 270000,
        rating: 4.5,
        categoryId: 1,
      ),
      Product(
        id: 8,
        name: "Smartphone Android",
        image: "assets/images/product8.png",
        isAsset: true,
        price: 2200000,
        rating: 4.7,
        categoryId: 2,
      ),
      Product(
        id: 9,
        name: "Powerbank 10000mAh",
        image: "assets/images/product9.png",
        isAsset: true,
        price: 120000,
        rating: 4.3,
        categoryId: 2,
      ),
      Product(
        id: 10,
        name: "Kacamata Fashion",
        image: "assets/images/product10.png",
        isAsset: true,
        price: 80000,
        rating: 4.0,
        categoryId: 2,
      ),
    ];
  }
}