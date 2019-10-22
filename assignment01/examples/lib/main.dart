import 'package:examples/product.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ShopApp());
}

class CustomTextStyle {
  static TextStyle titleStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 22,
    );
  }

  static TextStyle title01Style() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.grey[800],
    );
  }

  static TextStyle buttonStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
    );
  }

  static TextStyle locationStyle(Color color) {
    return TextStyle(
      fontFamily: 'Poppins',
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle regularStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      color: Colors.grey[600],
    );
  }
}

class SizeButton extends StatelessWidget {
  final int size;

  SizeButton(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          color: Colors.grey[300],
          width: 1.0,
        ),
      ),
      child: Center(
        child: Text(
          size.toString(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class SizeButtonRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> sizedButtonList = new List<Widget>();
    for (var i = 0; i < redShirt.sizes.length; ++i) {
      sizedButtonList.add(SizeButton(redShirt.sizes[i]));
    }
    //TODO: Add space between buttons
    return Row(children: sizedButtonList);
  }
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
              redShirt.imagePath,
              //scale : 0.5,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(),
                  //TODO: Remove transparent container, a litte bit dirty
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
                            style: CustomTextStyle.titleStyle(),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            redShirt.description,
                            style: CustomTextStyle.regularStyle(),
                            maxLines: 4,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Select Size",
                            style: CustomTextStyle.title01Style(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizeButtonRow(),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "DELIVERING TO ",
                                style: CustomTextStyle.locationStyle(
                                    Colors.grey[800]),
                              ),
                              Text(
                                redShirt.location.toUpperCase(),
                                style:
                                    CustomTextStyle.locationStyle(Colors.blue),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      bottomLeft: Radius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
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
                    color: Colors.grey[1000],
                    size: 24.0,
                  ),
                  Text(
                    "Back",
                    style: TextStyle(
                      color: Colors.grey[1000],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
