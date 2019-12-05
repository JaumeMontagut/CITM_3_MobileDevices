import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:examples/Model/product.dart';
import 'package:examples/Pages/productPage.dart';

class SelectProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<List<Product>>(context);
    return Scaffold(
      body: Scrollbar(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return FlatButton(
              child: Card(
                child: Center(
                  child: Text(
                    products[index].name,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductPage(index),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
