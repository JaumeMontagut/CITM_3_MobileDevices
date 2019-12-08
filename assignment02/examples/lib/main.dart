import 'package:examples/Model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:examples/Pages/selectProductPage.dart';
import 'Model/productsInCart.dart';

void main() {
  runApp(ShopApp());
}

class ShopApp extends StatelessWidget {
  List<Product> _products = [];
  ProductsInCart _productsInCartIndices = ProductsInCart();

  Widget _body() {
    return MultiProvider(
      providers: [
        Provider<List<Product>>.value(
          value: _products,
        ),
        ChangeNotifierProvider<ProductsInCart>.value(
          value: _productsInCartIndices,
        ),
      ],
      child: MaterialApp(
        home: SelectProductPage(_products.length),
      ),
    );
  }

  Widget _loadProducts() {
    return FutureBuilder(
      future: rootBundle.loadString('assets/products.json'),
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(),);
        }
        List json = jsonDecode(snapshot.data);
        _products = json.map((elem) => Product.fromJson(elem)).toList();
        return _loadProductsInCart();
      }
    );
  }

  Widget _loadProductsInCart ()
  {
    File file = _productsInCartIndices.createPath();
  }


  @override
  Widget build(BuildContext context) {
    return _loadProducts();
  }
}
