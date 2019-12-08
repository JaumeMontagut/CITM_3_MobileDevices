import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ProductsInCart with ChangeNotifier {
  List<int> indices = [];
  String path;

  ProductsInCart(){
    loadProductsInCart();
  }

  Future<File> get localFile async {
    final Directory folderDir = await getApplicationDocumentsDirectory();
    path = '${folderDir.path}/productsInCart.json';
    return File(path);
  }

//TODO: Join the functions into one
  void get loadProductsInCart async 
  {
    File file = await localFile;
    String fileContents = await file.readAsString();
    final json = jsonDecode(fileContents);
    if (json.length > 0) {
      Map<String, dynamic> jsonItem = json[0];
      indices = jsonItem['productsInCart'].cast<int>();
    }
  }

  int addElement(int index) {
    indices.add(index);
    notifyListeners();
    return index;
  }

  void removeElement(int index) {
    indices.removeWhere((item) => item == index);
    notifyListeners();
  }

  int numberOfItems() {
    return indices.length;
  }

  bool isSelected(int index) {
    return indices.any((item) => item == index);
  }
}
