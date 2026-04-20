import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _State();
}

class _State extends State<ProductListScreen> {
  List<Product> allProducts = [];
  List<Product> filteredProducts = [];

  int selectedCategory = 0;
  bool loading = true;

  final categories = const [
    {"id": 0, "name": "Semua"},
    {"id": 1, "name": "Sepatu"},
    {"id": 2, "name": "Aksesoris"},
    {"id": 3, "name": "Pakaian"},
  ];

  @override
  void initState() {
    super.initState();
    load();
  }

  Future load() async {
    final data = await ProductService.fetchProducts(0);

    setState(() {
      allProducts = data;
      filteredProducts = data;
      loading = false;
    });
  }

  void filterCategory(int categoryId) {
    setState(() {
      selectedCategory = categoryId;

      if (categoryId == 0) {
        filteredProducts = allProducts;
      } else {
        filteredProducts = allProducts
            .where((p) => p.categoryId == categoryId)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: Column(
        children: [
          /// 🔥 CATEGORY CHIPS
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: categories.length,
              itemBuilder: (_, i) {
                final cat = categories[i];
                final isActive = selectedCategory == cat["id"];

                return Padding(
                  padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                  child: GestureDetector(
                    onTap: () => filterCategory(cat["id"] as int),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: isActive ? Colors.green : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Center(
                        child: Text(
                          cat["name"].toString(),
                          style: TextStyle(
                            color: isActive ? Colors.white : Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          /// 🔥 PRODUCT GRID (Sudah ditambah RefreshIndicator sesuai Modul 6)
          Expanded(
            child: filteredProducts.isEmpty
                ? const Center(child: Text("Produk tidak tersedia"))
                : RefreshIndicator(
                    onRefresh: () => load(), // Memanggil fungsi load() untuk refresh data
                    color: Colors.green,     // Warna loading indicator
                    child: GridView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: filteredProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (_, i) {
                        final product = filteredProducts[i];
                        return ProductCard(
                          product: product,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    ProductDetailScreen(product: product),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}