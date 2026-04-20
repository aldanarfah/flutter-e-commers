import 'package:flutter/material.dart';
import '../services/order_service.dart';
import '../models/order.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {

  @override
  void didUpdateWidget(covariant OrdersScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    /// 🔥 FORCE REFRESH SAAT TAB BERUBAH
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final orders = OrderService.orders;

    return Scaffold(
      appBar: AppBar(title: const Text("Orders")),

      body: orders.isEmpty
          ? const Center(child: Text("Belum ada pesanan"))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (_, i) {
          final order = orders[i];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text("Order #${order.id}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Status: ${order.status}"),
                  Text("Total: Rp ${order.total.toInt()}"),
                ],
              ),
              trailing: Text(
                "${order.date.day}/${order.date.month}",
              ),
            ),
          );
        },
      ),
    );
  }
}