import 'package:examples/product.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

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

class ClothesSizeButton extends StatelessWidget {
  final int clothesSize;
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
  final int selectedNum;

  ClothesSizeListView(this.selectedNum);

  @override
  Widget build(BuildContext context) {
    List<Widget> clothesSizeListView = new List<Widget>();
    clothesSizeListView.add(
      SizedBox(width: 20),
    );
    for (var i = 0; i < redShirt.sizes.length; ++i) {
      clothesSizeListView.add(
        ClothesSizeButton(
          redShirt.sizes[i],
          i == selectedNum,
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

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatefulWidget{
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final int itemsOnShoppingCart = 3;
  List<Product> _products;

  @override
  void initState(){
    _loadProducts();
    super.initState();
  }

  Future<void> _loadProducts() async{
    try{
      Directory dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/assets/products.json');
      String fileContents = await file.readAsString();
      List json = jsonDecode(fileContents);
      List<Product> loaded = [];
      for (var elem in json)
      {
        loaded.add(Product.fromJson(elem));
      }
      super.setState(() => _products = loaded);
    } catch (e)
    {
      print("ERROR: Loading json");
      super.setState(() => _products);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Provider<List<Product>>.value(
      value: _products,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Image.asset(
              redShirt.imagePath,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            ListView(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                BottomPanel(),
              ],
            ),
            BackButton(),
            ShoppingCart(itemsOnShoppingCart: itemsOnShoppingCart)
          ],
        ),
      ),
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
                )),
          )
        ],
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
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

class BottomPanel extends StatelessWidget {
  static const double paddingSize = 20;

  const BottomPanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Divider(
              thickness: 3,
              indent: 162,
              endIndent: 162,
              color: Colors.grey[500]),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: paddingSize,
            ),
            child: Text(
              redShirt.name,
              style: CustomTextStyle.titleStyle(),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: paddingSize,
            ),
            child: Text(
              redShirt.description,
              style: CustomTextStyle.regularStyle(),
              maxLines: 4,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: paddingSize,
            ),
            child: Text(
              "Select Size",
              style: CustomTextStyle.title01Style(),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 40,
            child: ClothesSizeListView(0),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingSize),
            child: Row(
              children: <Widget>[
                Text(
                  "DELIVERING TO ",
                  style: CustomTextStyle.locationStyle(Colors.grey[800]),
                ),
                Text(
                  redShirt.location.toUpperCase(),
                  style: CustomTextStyle.locationStyle(Colors.blue[700]),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingSize),
            child: Container(
              width: 100,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 35,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.attach_money,
                            size: 13,
                            color: Colors.white,
                          ),
                          Text(
                            redShirt.price.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 65,
                    child: Container(
                      padding: EdgeInsets.all(
                        8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Add To Cart",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: Colors.white,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue[700],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
