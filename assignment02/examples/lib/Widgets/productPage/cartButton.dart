import 'package:flutter/material.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({
    Key key,
    @required this.itemsOnShoppingCart,
  }) : super(key: key);

  final int itemsOnShoppingCart;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 35,
      right: 20,
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
                  itemsOnShoppingCart.toString(),
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
    );
  }
}
