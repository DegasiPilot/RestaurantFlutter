import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersCollection {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addOrdersCollection(
    String image,
    String name,
    int price,
    int weight,
    List<String> composition,
    String uid,
  ) async {
    try {
      await _firebaseFirestore.collection('orders').add({
        'image' : image,
        'name' : name,
        'price' : price,
        'weight' : weight,
        'composition' : composition,
        'uid' : uid,
      });
    } catch (e) {
      return;
    }
  }

  Future<void> editOrdersCollection(
    dynamic doc,
    String image,
    String name,
    int price,
    int weight,
    List<String> composition,
    String uid,
  ) async {
    try{
      await _firebaseFirestore.collection('orders').doc(doc.id).update({
        'image': image,
        'name': name,
        'price' : price,
        'weight' : weight,
        'composition' : composition,
        'uid' : uid,
      });
    } catch (e) {
      return;
    }
  }

  Future<void> deleteOrdersCollection(dynamic doc) async {
    try {
      await _firebaseFirestore.collection('orders').doc(doc.id).delete();
    } catch (e) {
      return;
    }
  }
}
