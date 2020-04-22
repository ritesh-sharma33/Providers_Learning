import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/screens.dart/cart.dart';
import 'package:providers/screens.dart/login.dart';
import './models/cart.dart';
import './models/catalog.dart';
import 'screens.dart/catalog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel(),),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            cart.catalog = catalog;
            return cart;
          },
        )
      ],
      child: MaterialApp(
        title: 'Providers Shop',
        initialRoute: '/',
        routes: {
          '/': (context) => MyLogin(),
          '/catalog': (context) => MyCatalog(),
          '/cart': (context) => MyCart()
        },
      ),
    );
  }
}