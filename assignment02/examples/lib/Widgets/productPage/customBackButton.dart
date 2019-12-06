import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 35,
      left: 10,
      child: FlatButton
      (
        onPressed: () => Navigator.of(context).pop(),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.arrow_back_ios,
              color: Colors.grey[1000],
              size: 16.0,
            ),
            Text(
              "Back",
              style: TextStyle(
                color: Colors.grey[1000],
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}