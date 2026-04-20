import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onDelete;

  const CartItemWidget({super.key, required this.item, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.product.id.toString()),
      onDismissed: (_) => onDelete(),
      child: ListTile(
        title: Text(item.product.name),
        subtitle: Text("Qty: ${item.quantity}"),
        trailing: Text("\$${item.total}"),
      ),
    );
  }
}