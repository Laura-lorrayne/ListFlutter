import 'package:coffe_shop/mocks/mocks_products.dart';
import 'package:coffe_shop/models/product.dart';
import 'package:coffe_shop/Routes/routes_paths.dart';
import 'package:coffe_shop/screens/product_screen.dart';
import 'package:coffe_shop/screens/signin_screen.dart';
import 'package:coffe_shop/screens/sigup_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});
  final List<Product> _products = MOCK_PRODUCTS;
  Widget _generateTitleProducts(Product product) {
    return ListTile(
      leading: const Icon(Icons.shopping_bag),
      title: Text(
        product.nome,
        style: const TextStyle(
          fontSize: 20.0,
        ),
      ),
      subtitle: Text(product.tamanho),
      trailing: Text('R\$ ${product.valor.toStringAsFixed(2)}'),
    );
  }

  List<Widget> _generateListProducts(List<Product> products) {
    return products.map((product) => _generateTitleProducts(product)).toList();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green),
/*
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Consultor de preços'),
          ),
          body: Center(
            child: ListView(
              children: _generateListProducts(_products),
            ),
          )),
*/
      routes: {
        // RoutePaths.PRODUCTS_LIST_SCREEN: (context) =>
//ProductScreen(products: _products),
        RoutePaths.PRODUCT_SCREEN: (context) =>
            ProductScreen(products: _products),
        RoutePaths.SIGNIN_SCREEN: (context) => const SigninScreen(),
        RoutePaths.SIGNUP_SCREEN: (context) => const SignupScreen(),
      },

      //      ));
    );
  }
}
