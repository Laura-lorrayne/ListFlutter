import 'package:coffe_shop/models/product_history.dart';

import '../models/product.dart';

List<Product> MOCK_PRODUCTS = [
  Product(
      '1',
      'Baggio aramelo',
      23.00,
      'O café aromatizado Baggio Caramelo é uma excelente escolha para quem gosta de cafés naturalmente adocicados. Esse café oferece intensidade média, baixa acidez, o que realça seu corpo prolongado.',
      '250g',
      '100% Arábica',
      'Média',
      'imagesUrl'),
  Product(
      '2',
      'BAGGIO AROMAS CHOCOLATE TRUFADO',
      22.00,
      'O café aromatizado Chocolate Trufado proporciona uma experiência sensorial única e agradável com seu sabor doce, intensidade média, e textura encorpada e aveludada.',
      '250g',
      '100% Arábica',
      'Média',
      'imagesUrl')
];

List<ProductHistory> MOCK_PRODUCTS_HISTORY = [
  ProductHistory('1', '1', '100% Arábica', 28.00),
  ProductHistory('2', '2', '100% Arábica', 38.00)
];
