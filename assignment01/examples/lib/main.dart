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
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, right: 20, left: 20, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Divider(
                            thickness: 3,
                            indent: 135,
                            endIndent: 135,
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "Bodycon Dress",
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
