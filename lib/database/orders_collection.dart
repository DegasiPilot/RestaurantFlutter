import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersCollection {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addOrdersCollection(
    String userId,
    List<DocumentReference> foods,
  ) async {
    try {
      await _firebaseFirestore.collection('orders').add({
        'userId': userId,
        'foods': foods,
      });
    } catch (e) {
      return;
    }
  }

  Future<void> editOrdersCollection(
    dynamic doc,
    String userId,
    List<DocumentReference> foods,
  ) async {
    try {
      await _firebaseFirestore.collection('orders').doc(doc.id).update({
        'userId': userId,
        'foodsId': foods,
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
