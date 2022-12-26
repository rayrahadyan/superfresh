import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';
import 'package:superfresh/main.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Super Fresh'),
          actions: [
            IconButton(
              icon: Icon(Icons.person),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => profile()));
          }
        )
      ],
    ),
      body: ProductGrid(),
    );
  }
}
