import 'package:examples/Model/productsInCart.dart';
import 'package:examples/Pages/cartPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int numberOfItems = Provider.of<ProductsInCart>(context).numberOfItems();
    return Positioned(
      top: 35,
      right: 20,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CartPage(),
            ),
          );
        },
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Icon(
              // Icons.local_grocery_store,
              Icons.shopping_cart,
              color: Colors.grey[1000],
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
                  color: Colors.blue[700],
                ),
                child: Center(
                  child: Text(
                    numberOfItems.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 8,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
