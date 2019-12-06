import 'package:examples/Model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:examples/Pages/selectProductPage.dart';

void main() {
  runApp(ShopApp());
}

class ShopApp extends StatelessWidget {
  List<Product> _products = [];
  int currIndex = 0; //The index of the current product
  //TODO: Make the "Select product page" the main page

  Widget _body() {
    return Provider<List<Product>>.value(
      value: _products,
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
          return Center(child: CircularProgressIndicator());
        }
        List json = jsonDecode(snapshot.data);
        _products = json.map((elem) => Product.fromJson(elem)).toList();
        return _body();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _loadProducts();
  }
}
