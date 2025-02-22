import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ProductsInCart with ChangeNotifier {
  List<int> indices = [];
  String path;

  Future<void> loadProductsInCart() async {
    try {
      final Directory folderDir = await getApplicationDocumentsDirectory();
      path = '${folderDir.path}/productsInCart.json';
      final File file = File(path);
      final String fileContents = await file.readAsString();
      final List json = jsonDecode(fileContents);
      for (var elem in json){
        indices.add(elem);
      }
    } catch (e) {
      print("ERROR: Error while reading the file.");
      indices = [];
    }
  }

  Future<void> saveProductsInCart () async{
    final File file = File(path);
    final dynamic json = jsonEncode(indices);
    await file.writeAsString(json); 
  }

  int addElement(int index) {
    indices.add(index);
    notifyListeners();
    return index;
  }

  void removeElement(int index) {
    indices.removeAt(index);
    notifyListeners();
  }

  int numberOfItems() {
    return indices.length;
  }

  bool isSelected(int index) {
    return indices.any((item) => item == index);
  }
}
