import 'dart:math';
import 'package:flutter/cupertino.dart';
import '../models/product.dart';

class Products with ChangeNotifier {
  final List<Product> _allproducts = List.generate(
    15,
        (index) {
      return Product(
        id: "id_${index + 1}",
        title: "Product ${index + 1}",
        description: 'Ini adalah deskripsi produk ${index + 1}',
        price: 10 + Random().nextInt(100).toDouble(),
        imageUrl: 'https://picsum.photos/id/$index/200/300',
      );
    },
  );
  List<Product> get allproducts {
    return [..._allproducts];
  }

  Product findById(productId) {
    return _allproducts.firstWhere((prodId) => prodId.id == productId);
  }

// void addProduct() {
//   _allproducts.add(value);
//   notifyListeners();
// }

}
