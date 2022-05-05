class UserModel {
     String? name, email, uId, photo;

  UserModel({
    required this.name,
    required this.email,
    required this.uId,
    required this.photo,
  });

  UserModel.fromJson(Map<String, dynamic>? map) {
    if(map==null){
      return;
    }
    name = map['name'];
    email = map['email'];
    uId = map['uId'];
    photo = map['photo'];
  }

  toJson() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'photo': photo,
    };
  }
}
