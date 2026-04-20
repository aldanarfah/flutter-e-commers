import '../models/order.dart';

class OrderService {
  static final List<Order> _orders = [];

  static List<Order> get orders => _orders;

  static void add(Order order) {
    _orders.insert(0, order); // terbaru di atas
  }

  static void clear() {
    _orders.clear();
  }
}