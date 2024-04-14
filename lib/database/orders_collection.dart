import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersCollection {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addOrdersCollection(
    String image,
    String name,
    String price,
    String weight,
    List<dynamic> composition,
    int count,
    String uid,
  ) async {
    try {
      await _firebaseFirestore.collection('orders').add({
        'image' : image,
        'name' : name,
        'price' : price,
        'weight' : weight,
        'composition' : composition,
        'count' : count,
        'uid' : uid,
      });
    } catch (e) {
      return;
    }
  }

  Future<void> editOrdersCollection(
    dynamic doc,
    int count,
  ) async {
    try{
      await _firebaseFirestore.collection('orders').doc(doc.id).update({
        'count' : count,
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