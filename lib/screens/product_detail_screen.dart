import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/cart_service.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),

      body: Column(
        children: [
          /// IMAGE
          SizedBox(
            width: double.infinity,
            height: 250,
            child: product.isAsset
                ? Image.asset(product.image, fit: BoxFit.cover)
                : Image.network(product.image, fit: BoxFit.cover),
          ),

          /// CONTENT
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Rp ${product.price.toInt()}",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      const Icon(Icons.star,
                          color: Colors.orange, size: 18),
                      const SizedBox(width: 5),
                      Text("${product.rating}"),
                      const SizedBox(width: 10),
                      const Text("| Terjual 100+",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// DESKRIPSI (TETAP ADA)
                  const Text(
                    "Produk berkualitas tinggi dengan bahan terbaik. Cocok digunakan sehari-hari dengan desain modern dan nyaman.",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        CartService.add(product);

                        /// 🔥 CLEAR SNACKBAR LAMA
                        ScaffoldMessenger.of(context).clearSnackBars();

                        /// 🔥 SNACKBAR 5 DETIK TANPA BUTTON
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 5),
                            content: Text(
                                "Berhasil ditambahkan ke keranjang"),
                          ),
                        );
                      },
                      child: const Text("Tambah ke Keranjang"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}