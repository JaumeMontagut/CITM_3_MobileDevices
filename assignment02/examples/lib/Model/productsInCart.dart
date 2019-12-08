import 'package:flutter/material.dart';

class ProductsInCart with ChangeNotifier
{
  List<int> indices;

  ProductsInCart(this.indices);

  void addElement(int index)
  {
    indices.add(index);
  }

  void removeElement(int index)
  {
    indices.removeWhere((item) => item == index);
  }

  bool isSelected(int index)
  {
    return indices.any((item) => item == index);
  }
}