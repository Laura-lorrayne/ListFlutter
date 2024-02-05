import 'package:coffe_shop/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails(this.product, {super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(product.imagesUrl),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              'Detalhes de $product.name',
              style: const TextStyle(fontSize: 30.0),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              product.descricao,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 30.0),
            ),
          ),
        )
      ],
    );
  }
}
