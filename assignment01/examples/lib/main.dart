import 'package:examples/product.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ShopApp());
}

class ShopApp extends StatelessWidget {
  final int itemsOnShoppingCart = 3;
  // final TextStyle titleStyle = TextStyle(
  //   fontWeight: FontWeight.bold,
  //   fontSize: 20,
  // );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Image.asset(
              'assets/clothes.png',
            ),
            Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(),
                  //TOREMOVE: Transparent container, a litte bit dirty
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        right: 20,
                        left: 20,
                        bottom: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Divider(
                            thickness: 3,
                            indent: 135,
                            endIndent: 135,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            redShirt.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              top: 35,
              left: 10,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey[800],
                    size: 24.0,
                  ),
                  Text("Back"),
                ],
              ),
            ),
            Positioned(
              top: 35,
              right: 20,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.grey[800],
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
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Text(
                            itemsOnShoppingCart.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
