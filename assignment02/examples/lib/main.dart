import 'package:examples/Model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:examples/Pages/productPage.dart';
import 'package:examples/Pages/selectProductPage.dart';

void main() {
  runApp(ShopApp());
}

class CustomTextStyle {
  static TextStyle titleStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 22,
    );
  }

  static TextStyle title01Style() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 17,
      color: Colors.grey[850],
    );
  }

  static TextStyle buttonStyle(Color color) {
    return TextStyle(
      fontFamily: 'Poppins',
      color: color,
      fontSize: 15,
    );
  }

  static TextStyle locationStyle(Color color) {
    return TextStyle(
      fontFamily: 'Poppins',
      color: color,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle regularStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 11,
      color: Colors.grey[600],
    );
  }
}

class ShopApp extends StatelessWidget {
  List<Product> _products = [];
  int currIndex = 0; //The index of the current product
  //TODO: Make the "Select product page" the main page

  Widget _body() {
    return Provider<List<Product>>.value(
      value: _products,
      child: MaterialApp(
        home: SelectProductPage(),
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return _loadProducts();
  }
}

class ClothesSizeButton extends StatelessWidget {
  final double clothesSize;
  final bool selected;

  ClothesSizeButton(this.clothesSize, this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          color: selected ? Colors.grey[900] : Colors.grey[300],
          width: 1.0,
        ),
        color: selected ? Colors.grey[900] : null,
      ),
      child: Center(
        child: Text(
          clothesSize.toString(),
          textAlign: TextAlign.center,
          style: CustomTextStyle.buttonStyle(
              selected ? Colors.white : Colors.grey[900]),
        ),
      ),
    );
  }
}

class ClothesSizeListView extends StatelessWidget {
  final int productIdx;
  final int selectedButtonIdx;

  ClothesSizeListView(this.productIdx, this.selectedButtonIdx);

  @override
  Widget build(BuildContext context) {
    Product product = Provider.of<List<Product>>(context)[productIdx];
    List<Widget> clothesSizeListView = new List<Widget>();
    clothesSizeListView.add(
      SizedBox(width: 20),
    );
    for (var i = 0; i < product.sizes.length; ++i) {
      clothesSizeListView.add(
        ClothesSizeButton(
          product.sizes[i],
          i == selectedButtonIdx,
        ),
      );
      clothesSizeListView.add(
        SizedBox(
          width: 15,
        ),
      );
    }
    return ListView(
      children: clothesSizeListView,
      scrollDirection: Axis.horizontal,
    );
  }
}

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({
    Key key,
    @required this.itemsOnShoppingCart,
  }) : super(key: key);

  final int itemsOnShoppingCart;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 35,
      right: 20,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Icon(
            // Icons.local_grocery_store,
            Icons.shopping_cart,
            color: Colors.grey[1000],
            size: 26.0,
          ),
          Positioned(
            top: -2,
            right: 0,
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue[700],
              ),
              child: Center(
                child: Text(
                  itemsOnShoppingCart.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 8,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 35,
      left: 10,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.arrow_back_ios,
            color: Colors.grey[1000],
            size: 16.0,
          ),
          Text(
            "Back",
            style: TextStyle(
              color: Colors.grey[1000],
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}