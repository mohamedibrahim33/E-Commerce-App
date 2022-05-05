import 'package:ecommerce_app/core/services/home_service.dart';
import 'package:ecommerce_app/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/products_model.dart';

class HomeViewModel extends GetxController {
  final ValueNotifier<bool> _loading=ValueNotifier(false);
  ValueNotifier<bool> get loading=> _loading;

  final List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;
  final List<ProductsModel> _productsModel = [];
  List<ProductsModel> get productsModel => _productsModel;

  HomeViewModel() {
    getCategory();
  }

  getCategory() async {
    loading.value=true;
      HomeService().getCategory().then((value) {
        for (int i = 0; i < value.length; i++) {
         _categoryModel.add(CategoryModel.fromJson(value[i].data() as Map<String, dynamic>));
        }
        getProducts();
    });
  }

  getProducts()  {
      HomeService().getProducts().then((value) {
        for (int i = 0; i < value.length; i++) {
         _productsModel.add(ProductsModel.fromJson(value[i].data() as Map<String, dynamic>));
      }
        update();
        loading.value=false;
      });
  }
}
