import 'dart:core';
import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/core/view_model/cart_view_model.dart';
import 'package:ecommerce_app/view/widget/custom_button.dart';
import 'package:ecommerce_app/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewModel>(
              init: Get.find<CartViewModel>(),
              builder: (controller) => ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: 140,
                    child: Row(
                      children: [
                        Container(
                            height: 140,
                            width: 120,
                            child: Image.network(
                              controller.cartProduct[index].image,
                              fit: BoxFit.fill,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: controller.cartProduct[index].name,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                text:
                                    '\$ ${controller.cartProduct[index].price}',
                                color: primaryColor,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.grey.shade200,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: const Padding(
                                          padding: EdgeInsets.only(top: 3),
                                          child: Icon(Icons.add),
                                        ),
                                        onPressed: () {
                                          controller.increaseQuantity(index);
                                        },
                                        color: Colors.black,
                                      ),
                                      CustomText(
                                        text: controller
                                            .cartProduct[index].quantity
                                            .toString(),
                                        fontSize: 20,
                                        alignment: Alignment.center,
                                      ),
                                      IconButton(
                                        icon: const Padding(
                                          padding: EdgeInsets.only(bottom: 25),
                                          child: Icon(Icons.minimize),
                                        ),
                                        onPressed: () {
                                          controller.decreaseQuantity(index);
                                        },
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: controller.cartProduct.length,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 30,
              left: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children:  [
                    const CustomText(
                      text: 'Total',
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GetBuilder<CartViewModel>(
                      builder:(controller)=> CustomText(
                        text: '\$ ${controller.totalPrice}',
                        fontSize: 22,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                Container(
                    width: 140,
                    height: 50,
                    child: CustomButton(
                      text: 'CheckOut',
                      onPressed: () {},
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
