import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'product_item.dart';
import 'package:superfresh/provider/all_products.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final allProduct = productData.allproducts;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: allProduct.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: allProduct[i], child: ProductItem()),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}

// class ProductGrid extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final productData = Provider.of<Products>(context);
//     final allProduct = productData.allproducts;

//     return GridView.builder(
//       padding: const EdgeInsets.all(10.0),
//       itemCount: allProduct.length,
//       itemBuilder: (ctx, i) => ChangeNotifierProvider(
//           create: (context) => allProduct[i], 
//           child: ProductItem()),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 3 / 2,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//       ),
//     );
//   }
// }
