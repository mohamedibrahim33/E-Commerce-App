import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/core/view_model/home_view_model.dart';
import 'package:ecommerce_app/view/details_view.dart';
import 'package:ecommerce_app/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init:HomeViewModel() ,
      builder: (controller) =>controller.loading.value?const Center(child:  CircularProgressIndicator()): Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 60,
              left: 15,
              right: 15,
            ),
            child: Column(
              children: [
                _searchTextFormField(),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: 'Categories',
                  fontSize: 18,
                ),
                const SizedBox(
                  height: 10,
                ),
                _listViewCategory(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomText(
                      text: 'Best Selling',
                      fontSize: 18,
                    ),
                    CustomText(
                      text: 'See all',
                      fontSize: 18,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                _listViewProducts(),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 90,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  height: 60,
                  width: 60,
                  child: Image.network(controller.categoryModel[index].image),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: controller.categoryModel[index].name,
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 20,
          ),
          itemCount: controller.categoryModel.length,
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller)=> Container(
        height: 330,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Get.to(DetailsView(model: controller.productsModel[index]));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .4,
                      height: 220,
                      child: Image.network(
                        controller.productsModel[index].image,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     CustomText(
                      text: controller.productsModel[index].name,
                      alignment: Alignment.bottomLeft,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     CustomText(
                      text: controller.productsModel[index].description,
                      fontSize: 12,
                      color: Colors.grey,
                      alignment: Alignment.bottomLeft,
                       maxLines: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     CustomText(
                      text: controller.productsModel[index].price+' \$',
                      color: primaryColor,
                      alignment: Alignment.bottomLeft,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 20,
          ),
          itemCount: controller.productsModel.length,
        ),
      ),
    );
  }
}
