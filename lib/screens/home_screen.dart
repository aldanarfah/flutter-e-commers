import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future load() async {
    final data = await ProductService.fetchProducts(0);
    setState(() {
      products = data;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// SEARCH BAR (redirect ke search screen)
            Padding(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/search');
                },
                child: const TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: "Cari produk...",
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),

            /// PRODUCT GRID
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: products.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (_, i) {
                  final product = products[i];

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
      ),
    );
  }
}