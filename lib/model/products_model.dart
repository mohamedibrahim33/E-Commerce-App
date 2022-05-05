import 'package:ecommerce_app/helper/extension.dart';
import 'package:flutter/material.dart';

class ProductsModel {
  late String name, image, description, sized, price , productId;
  late Color color;

  ProductsModel({
    required this.name,
    required this.image,
    required this.description,
    required this.color,
    required this.sized,
    required this.price,
    required this.productId,
  });

  ProductsModel.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    sized = map['sized'];
    price = map['price'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'sized': sized,
      'price': price,
      'productId': productId,
    };
  }
}
