
class CartProductsModel {
  late String name, image, price,productId;
  late int quantity;

  CartProductsModel({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.productId,
  });

  CartProductsModel.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'productId': productId,
    };
  }
}
