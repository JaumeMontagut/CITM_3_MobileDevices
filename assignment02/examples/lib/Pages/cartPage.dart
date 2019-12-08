import 'package:examples/Helpers/TextStyles.dart';
import 'package:examples/Model/product.dart';
import 'package:examples/Model/productsInCart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  final int column1Space = 20;
  final int column2Space = 20;

  @override
  Widget build(BuildContext context) {
    ProductsInCart productsInCart = Provider.of<ProductsInCart>(context);
    List<Product> products = Provider.of<List<Product>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            productsInCart.numberOfItems(),
            (index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 7,
                        child: Text(
                          products[productsInCart.indices[index]].name,
                          style: CustomTextStyle.title01Style(),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.attach_money,
                            ),
                            Text(
                              products[productsInCart.indices[index]]
                                  .price
                                  .toString(),
                              style: CustomTextStyle.title01Style(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Products {}
