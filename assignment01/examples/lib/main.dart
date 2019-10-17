import 'package:flutter/material.dart';

void main() {
  runApp(
    ShopApp()
  );
}

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(color : Colors.blue),
      ),
    );
  }
}