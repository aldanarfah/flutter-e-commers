import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 6,
                color: Colors.black12,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔥 IMAGE + FAVORITE
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: product.isAsset
                          ? Image.asset(
                        product.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )
                          : Image.network(
                        product.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),

                    /// ❤️ FAVORITE BUTTON
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          product.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// 🔥 CONTENT
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// NAME
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        height: 1.3,
                      ),
                    ),

                    const SizedBox(height: 6),

                    /// PRICE
                    Text(
                      "Rp ${product.price.toInt()}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.green,
                      ),
                    ),

                    const SizedBox(height: 6),

                    /// RATING + SOLD
                    Row(
                      children: [
                        const Icon(Icons.star,
                            size: 14, color: Colors.orange),
                        const SizedBox(width: 4),
                        Text(
                          "${product.rating}",
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          "|  Terjual 100+",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}