import 'package:examples/Model/productsInCart.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:examples/Model/product.dart';
import 'package:examples/Helpers/TextStyles.dart';
import 'package:examples/Widgets/productPage/clothesSizes.dart';
import 'dart:io';
import 'dart:convert';

class BottomPanel extends StatelessWidget {
  static const double paddingSize = 20;
  final int index;

  BottomPanel(this.index);

  @override
  Widget build(BuildContext context) {
    Product product = Provider.of<List<Product>>(context)[index];
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
              product.name,
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
              product.description,
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
            child: ClothesSizeListView(index, 0),
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
                  product.location.toUpperCase(),
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
            child: AddToCart(index),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}

class AddToCart extends StatelessWidget {
  final int index;

  AddToCart(this.index);

  @override
  Widget build(BuildContext context) {
    Product product = Provider.of<List<Product>>(context)[index];
    return Container(
      width: 100,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
      child: InkWell(
        onTap: () {
          ProductsInCart productsInCart =
              Provider.of<ProductsInCart>(context, listen: false);
          productsInCart.addElement(index);
          productsInCart.saveProductsInCart();
        },
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
                      product.price.toString(),
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
    );
  }
}
