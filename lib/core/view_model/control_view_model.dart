import 'package:ecommerce_app/view/account_view.dart';
import 'package:ecommerce_app/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/cart_view.dart';

class ControlViewModel extends GetxController{
  Widget _currentWidget=HomeView();

 int _navigatorValue=0;

get navigatorValue=>_navigatorValue;

get currentWidget=>_currentWidget;
void changeSelectedValue(int selectedValue){
  _navigatorValue=selectedValue;
  switch(selectedValue){
    case 0 :{
      _currentWidget=HomeView();
      break;
    }
    case 1 :{
      _currentWidget=CartView();
      break;
    }
    case 2 :{
      _currentWidget=AccountView();
      break;
    }
  }
  update();
}
}