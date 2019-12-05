import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:examples/Model/product.dart';
import 'package:examples/main.dart';//TOOD: Extract shopping cart widget and remove this
import 'package:examples/Widgets/productPage/bottomPanel.dart';


class ProductPage extends StatefulWidget {
  final int index;
  ProductPage(this.index);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final int itemsOnShoppingCart = 3;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Product product = Provider.of<List<Product>>(context)[widget.index];
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            product.imagePath,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          ListView(
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              BottomPanel(widget.index),
            ],
          ),
          CustomBackButton(),
          ShoppingCart(itemsOnShoppingCart: itemsOnShoppingCart)
        ],
      ),
    );
  }
}