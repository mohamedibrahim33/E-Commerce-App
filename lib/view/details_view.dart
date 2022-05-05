import 'package:ecommerce_app/view/widget/custom_button.dart';
import 'package:ecommerce_app/view/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/view_model/cart_view_model.dart';
import '../model/cart_product_model.dart';
import '../model/products_model.dart';

class DetailsView extends StatelessWidget {
  ProductsModel model;

  DetailsView({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Image.network(
                model.image,
                fit: BoxFit.fill,
              )),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    CustomText(
                      text: model.name,
                      fontSize: 26,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          width: MediaQuery.of(context).size.width * .44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CustomText(
                                text: 'size',
                              ),
                              CustomText(
                                text: model.sized,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          width: MediaQuery.of(context).size.width * .44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CustomText(
                                text: 'color',
                              ),
                              Container(
                                width: 35,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  color: model.color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const CustomText(
                      text: 'Details',
                      fontSize: 18,
                    ),
                    const SizedBox(height: 10),
                    CustomText(
                      text: model.description,
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const CustomText(
                      text: 'PRICE',
                      fontSize: 12,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      text: '\$ ' + model.price,
                      fontSize: 18,
                    ),
                  ],
                ),
                GetBuilder<CartViewModel>(
                  init: Get.find<CartViewModel>(),
                  builder:(controller)=> Container(
                    width: 150,
                    child: CustomButton(
                      text: 'ADD',
                      onPressed: () {
                        controller.addProduct(CartProductsModel(
                          name: model.name,
                          image: model.image,
                          price: model.price,
                          quantity: 1,
                          productId: model.productId,
                        ));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
