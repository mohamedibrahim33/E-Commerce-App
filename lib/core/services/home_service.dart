import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService{
  final CollectionReference<Map<String, dynamic>> _categoryCollectionRef =
  FirebaseFirestore.instance.collection('category');

  final CollectionReference<Map<String, dynamic>> _productsCollectionRef =
  FirebaseFirestore.instance.collection('products');

  Future<List<QueryDocumentSnapshot>> getCategory()async{
    var value = await _categoryCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProducts()async{
    var value = await _productsCollectionRef.get();
    return value.docs;
  }
}