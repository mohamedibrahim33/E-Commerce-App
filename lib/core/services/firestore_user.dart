import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/user_model.dart';

class FireStoreUser{
  final CollectionReference _userCollectionRef=FirebaseFirestore.instance.collection('Users');
  Future<void> addUserToFireStore(UserModel userModel)async{
    _userCollectionRef.doc(userModel.uId).set(userModel.toJson());

  }
  Future<DocumentSnapshot> getCurrentUser(String uId)async{
    return await _userCollectionRef.doc(uId).get();
  }
}