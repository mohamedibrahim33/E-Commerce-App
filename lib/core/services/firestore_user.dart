import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreUser{
  final CollectionReference _userCollectionRef=FirebaseFirestore.instance.collection('Users');
  Future<void> addUserToFireStore(UserModel userModel)async{
    _userCollectionRef.doc(userModel.uId).set(userModel.toJson());

  }
}