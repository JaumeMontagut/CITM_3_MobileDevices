import 'package:flutter/material.dart';

void main() {
  runApp(ShopApp());
}

class ShopApp extends StatelessWidget {
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
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

// child: Icon(
//   Icons.arrow_back_ios,
//   color: Colors.pink,
//   size: 24.0)
// child: Icon(
//   Icons.shopping_cart,
//   color: Colors.pink,
//   size: 24.0,
//   semanticLabel: 'Text to announce in acessibility modes',
// ),
