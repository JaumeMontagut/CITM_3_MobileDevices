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
  ProductsInCart _productsInCartIndices;

  Widget _body() {
    return MultiProvider(
      providers: [
        Provider<List<Product>>.value(
          value: _products,
        ),
        Provider<ProductsInCart>.value(
          value: _productsInCartIndices,
        ),
      ],
      child: MaterialApp(
        home: SelectProductPage(_products.length),
      ),
    );
  }

  bool _loadProducts() {
    bool loadedProducts = false;
    FutureBuilder(
      future: rootBundle.loadString('assets/products.json'),
      builder: (context, AsyncSnapshot<String> snapshot) {
        loadedProducts = snapshot.hasData;
        List json = jsonDecode(snapshot.data);
        _products = json.map((elem) => Product.fromJson(elem)).toList();
        return Container();//Builder needs to returna  widget, so we're returning an empty container
      },
    );
    return loadedProducts;
  }

  bool _loadProductsInCart() {
    bool loadedProductsInCart = false;
    FutureBuilder(
      future: rootBundle.loadString('assets/productsInCart.json'),
      builder: (context, AsyncSnapshot<String> snapshot) {
        loadedProductsInCart = snapshot.hasData;
        List json = jsonDecode(snapshot.data);
        _productsInCartIndices.indices = json.map((elem) => _productsInCartIndices.addElement(elem)).toList();
        return Container();//Builder needs to returna  widget, so we're returning an empty container
      },
    );
    return loadedProductsInCart;
  }

  @override
  Widget build(BuildContext context) {
    bool loadingProducts = _loadProducts();
    bool loadingProductsInCart = _loadProductsInCart();
    if (loadingProducts || loadingProductsInCart) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return _body();
    }
  }
}
