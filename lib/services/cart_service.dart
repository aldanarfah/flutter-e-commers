import '../models/cart_item.dart';
import '../models/product.dart';

class CartService {
  static final List<CartItem> _items = [];

  static List<CartItem> get items => _items;

  static void add(Product product) {
    final index = _items.indexWhere((e) => e.product.id == product.id);
    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(product: product));
    }
  }

  static void remove(int id) {
    _items.removeWhere((e) => e.product.id == id);
  }

  static double get total =>
      _items.fold(0, (sum, item) => sum + item.total);
}