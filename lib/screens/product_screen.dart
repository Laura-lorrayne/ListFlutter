import 'package:coffe_shop/components/product_details.dart';
import 'package:coffe_shop/models/product.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required List<Product> products});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)?.settings.arguments as Product;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("produtos"),
              bottom: const TabBar(tabs: [
                Tab(text: 'Detalhes'),
              ]),
            ),
            body: TabBarView(
              children: [
                ProductDetails(product),
              ],
            )));
  }
}
