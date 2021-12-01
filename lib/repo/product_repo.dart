import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ftask/model/product_model.dart';

class AllProductsRepo{
  // List<Products> items = [];
  // // Fetch content from the json file
  // Future<List<Products>> readJson() async {
  //   final String response = await rootBundle.loadString('asset/properties.json');
  //   final data = await json.decode(response);
  //   items.add(data);
  //   return items;
  // }

  Future<List<Products>> readJson() async {
    final String response = await rootBundle.loadString('asset/properties.json');
    //final data = await json.decode(response);
    List<Products> products = productsFromJson(response);
    return products;
  }

}