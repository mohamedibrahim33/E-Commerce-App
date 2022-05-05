import 'package:ecommerce_app/core/services/database/cart_database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/cart_product_model.dart';

class CartViewModel extends GetxController{
  var dbHelper= CartDatabaseHelper.db;

  CartViewModel(){
    getAllProduct();
  }

  final ValueNotifier<bool> _loading=ValueNotifier(false);
  ValueNotifier<bool> get loading=> _loading;

List<CartProductsModel> _cartProduct=[];
  List<CartProductsModel> get cartProduct=> _cartProduct;

   double _totalPrice=0.0;
  double get totalPrice=> _totalPrice;


  getAllProduct()async{
    _cartProduct=await dbHelper.getAllProduct();
    print(cartProduct.length);
    getTotalPrice();
    update();
  }
  addProduct(CartProductsModel model)async{
      for(int i = 0 ; i<_cartProduct.length;i++){
        if(_cartProduct[i].productId==model.productId){
          return ;
        }
    }
      await dbHelper.insert(model);
      _cartProduct.add(model);
      _totalPrice+=(double.parse(model.price)*model.quantity);

      update();
  }

  getTotalPrice(){
    for(int i = 0 ; i<_cartProduct.length;i++){
      _totalPrice+=(double.parse(_cartProduct[i].price)*_cartProduct[i].quantity);
    }
    update();
    print(_totalPrice);

  }

  increaseQuantity(int index){
    _cartProduct[index].quantity++;
    _totalPrice+=double.parse(_cartProduct[index].price);
    dbHelper.update(_cartProduct[index]);
    update();
  }

  decreaseQuantity(int index){
    if(_cartProduct[index].quantity!=1){
      _cartProduct[index].quantity--;
      _totalPrice-=double.parse(_cartProduct[index].price);
      dbHelper.update(_cartProduct[index]);
      update();
    }
  }
}