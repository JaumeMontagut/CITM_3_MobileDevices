import 'package:flutter/material.dart';

void main() {
  runApp(ShopApp());
}

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Image.asset('assets/clothes.png'),
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