import 'package:flutter/material.dart';

// screens
import 'screens/home_screen.dart';
import 'screens/product_list_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce',
      debugShowCheckedModeBanner: false,

      /// 🔥 ROUTES (optional, tapi tetap aman)
      routes: {
        '/search': (_) => const SearchScreen(),
      },

      /// 🔥 THEME PREMIUM
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),

        scaffoldBackgroundColor: const Color(0xFFF5F5F5),

        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: false,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),

        cardTheme: CardThemeData(
          elevation: 2,
          shadowColor: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),

      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    /// 🔥 PAGES DINAMIS (PENTING)
    final pages = [
      const HomeScreen(),
      const ProductListScreen(),

      CartScreen(
        onCheckoutSuccess: () {
          setState(() {
            index = 3; // pindah ke Orders
          });
        },
      ),

      const OrdersScreen(),
      const SearchScreen(),
    ];

    return Scaffold(
      body: SafeArea(
        child: pages[index],
      ),

      /// 🔥 BOTTOM NAVBAR
      bottomNavigationBar: NavigationBar(
        height: 65,
        selectedIndex: index,
        backgroundColor: Colors.white,
        indicatorColor: Colors.green.withOpacity(0.2),
        labelBehavior:
        NavigationDestinationLabelBehavior.alwaysShow,

        onDestinationSelected: (i) {
          setState(() {
            index = i;
          });
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.grid_view_outlined),
            selectedIcon: Icon(Icons.grid_view),
            label: "Products",
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long),
            label: "Orders",
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search),
            label: "Search",
          ),
        ],
      ),
    );
  }
}