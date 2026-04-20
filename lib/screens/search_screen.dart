import 'dart:async';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _State();
}

class _State extends State<SearchScreen> {
  List<Product> allProducts = [];
  List<Product> results = [];
  Timer? debounce;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future load() async {
    final data = await ProductService.fetchProducts(0);
    setState(() {
      allProducts = data;
    });
  }

  void onSearch(String query) {
    debounce?.cancel();

    debounce = Timer(const Duration(milliseconds: 300), () {
      final filtered = allProducts.where((p) {
        return p.name.toLowerCase().contains(query.toLowerCase());
      }).toList();

      setState(() {
        results = filtered;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: onSearch,
              decoration: const InputDecoration(
                hintText: "Cari produk...",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),

          Expanded(
            child: results.isEmpty
                ? const Center(child: Text("Tidak ada hasil"))
                : GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: results.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (_, i) {
                final product = results[i];

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
        ],
      ),
    );
  }
}