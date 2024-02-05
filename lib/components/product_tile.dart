import 'package:coffe_shop/Routes/routes_paths.dart';
import 'package:coffe_shop/models/product.dart';
import 'package:flutter/material.dart';

class ListeTile extends StatelessWidget {
  const ListeTile(this.product, {super.key});

  final Product product;
  String formatPrice() {
    return 'R\$ ${product.valor.toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.shopping_bag),
      title: Text(
        product.nome,
        style: const TextStyle(
          fontSize: 20.0,
        ),
      ),
      subtitle: Text(product.tamanho),
      trailing: Text('R\$ ${formatPrice()}'),
      onTap: () => {
        Navigator.of(context).pushNamed(
          RoutePaths.PRODUCT_SCREEN,
          arguments: product,
        )
      },
    );
  }
}
