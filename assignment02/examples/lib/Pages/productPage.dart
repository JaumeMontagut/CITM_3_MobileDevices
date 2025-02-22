import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:examples/Model/product.dart';
import 'package:examples/Widgets/productPage/bottomPanel.dart';
import 'package:examples/Widgets/productPage/cartButton.dart';
import 'package:examples/Widgets/productPage/customBackButton.dart';


class ProductPage extends StatefulWidget {
  ProductPage(this.index);
  final int index;

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

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
          Image.network(
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
          ShoppingCart()
        ],
      ),
    );
  }
}