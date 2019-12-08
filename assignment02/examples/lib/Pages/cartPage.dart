import 'package:examples/Helpers/TextStyles.dart';
import 'package:examples/Model/product.dart';
import 'package:examples/Model/productsInCart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  final int column1Space = 20;
  final int column2Space = 20;

  Widget _totalPrice(double totalPrice) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Text(
                'TOTAL:',
                style: CustomTextStyle.title01Style(),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.attach_money, color: Colors.grey[850]),
                  Text(
                    totalPrice.toString(),
                    style: CustomTextStyle.title01Style(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _cartAndTotal(BuildContext context) {
    ProductsInCart productsInCart = Provider.of<ProductsInCart>(context);
    List<Product> products = Provider.of<List<Product>>(context);
    double totalPrice = 0.0;
    for (var index in productsInCart.indices) {
      totalPrice += products[index].price;
    }
    List<Widget> widgets = List.generate(
      productsInCart.numberOfItems(),
      (index) {
        return Dismissible(
          onDismissed: (direction) {
            productsInCart.removeElement(index);
            //widgets.removeAt(index);
          },
          background: Container(color: Colors.red),
          key: UniqueKey(),
          child: Padding(
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
                      style: CustomTextStyle.cartTextStyle(),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.attach_money,
                          color: Colors.white,
                        ),
                        Text(
                          products[productsInCart.indices[index]]
                              .price
                              .toString(),
                          style: CustomTextStyle.cartTextStyle(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    widgets.add(_totalPrice(totalPrice));
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Scrollbar(
          child: ListView(
            children: _cartAndTotal(context),
          ),
        ),
      ),
    );
  }
}
