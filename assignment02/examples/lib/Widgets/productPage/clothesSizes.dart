import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:examples/Model/product.dart';
import 'package:examples/Helpers/TextStyles.dart';

class ClothesSizeListView extends StatelessWidget {
  final int productIdx;
  final int selectedButtonIdx;

  ClothesSizeListView(this.productIdx, this.selectedButtonIdx);

  @override
  Widget build(BuildContext context) {
    Product product = Provider.of<List<Product>>(context)[productIdx];
    List<Widget> clothesSizeListView = new List<Widget>();
    clothesSizeListView.add(
      SizedBox(width: 20),
    );
    for (var i = 0; i < product.sizes.length; ++i) {
      clothesSizeListView.add(
        ClothesSizeButton(
          product.sizes[i],
          i == selectedButtonIdx,
        ),
      );
      clothesSizeListView.add(
        SizedBox(
          width: 15,
        ),
      );
    }
    return ListView(
      children: clothesSizeListView,
      scrollDirection: Axis.horizontal,
    );
  }
}

class ClothesSizeButton extends StatelessWidget {
  final double clothesSize;
  final bool selected;

  ClothesSizeButton(this.clothesSize, this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          color: selected ? Colors.grey[900] : Colors.grey[300],
          width: 1.0,
        ),
        color: selected ? Colors.grey[900] : null,
      ),
      child: Center(
        child: Text(
          clothesSize.toString(),
          textAlign: TextAlign.center,
          style: CustomTextStyle.buttonStyle(
              selected ? Colors.white : Colors.grey[900]),
        ),
      ),
    );
  }
}