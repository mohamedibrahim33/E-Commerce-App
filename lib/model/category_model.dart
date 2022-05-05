class CategoryModel{
  late String name , image;

  CategoryModel({required this.name, required this.image});

   CategoryModel.fromJson(Map<String,dynamic> map){
    name=map['name'];
    image=map['image'];
  }

  toMap()
  {
    return {
      'name':name,
      'image':image,
    };
  }
}