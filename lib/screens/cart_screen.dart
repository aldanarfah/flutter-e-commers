import 'package:flutter/material.dart';
import '../services/cart_service.dart';
import '../services/order_service.dart';
import '../models/order.dart';
import '../widgets/cart_item_widget.dart';

class CartScreen extends StatefulWidget {
  final VoidCallback? onCheckoutSuccess;

  const CartScreen({super.key, this.onCheckoutSuccess});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    final items = CartService.items;

    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),

      body: items.isEmpty
          ? const Center(child: Text("Cart kosong"))
          : Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (_, i) => CartItemWidget(
                item: items[i],
                onDelete: () {
                  setState(() {
                    CartService.remove(items[i].product.id);
                  });
                },
              ),
            ),
          ),

          /// TOTAL + CHECKOUT
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 5)
              ],
            ),
            child: Column(
              children: [
                Text(
                  "Total: Rp ${CartService.total.toInt()}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (items.isEmpty) return;

                      /// 🔥 SIMPAN ORDER
                      final order = Order(
                        id: DateTime.now().millisecondsSinceEpoch,
                        total: CartService.total,
                        status: "Diproses",
                        date: DateTime.now(),
                      );

                      OrderService.add(order);

                      /// kosongkan cart
                      CartService.items.clear();

                      /// refresh cart UI
                      setState(() {});

                      /// 🔥 PINDAH KE TAB ORDERS
                      if (widget.onCheckoutSuccess != null) {
                        widget.onCheckoutSuccess!();
                      }
                    },
                    child: const Text("Checkout"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}