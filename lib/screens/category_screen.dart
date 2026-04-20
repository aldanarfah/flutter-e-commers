import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.extent(
        maxCrossAxisExtent: 200,
        children: List.generate(6, (i) {
          return Card(child: Center(child: Text("Category $i")));
        }),
      ),
    );
  }
}