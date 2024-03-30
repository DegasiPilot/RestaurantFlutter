import 'package:cloud_firestore/cloud_firestore.dart';

class FoodsCollection {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<void> addFoodsCollection(
    String image,
    String name,
    int price,
    int weight,
    List<String> composition,
  ) async {
    try {
      await _firebaseFirestore.collection('foods').add({
        'image' : image,
        'name' : name,
        'price' : price,
        'weight' : weight,
        'composition' : composition,
      });
    } catch (e) {
      return;
    }
  }

  Future<void> editFoodsCollection(
    dynamic doc,
    String image,
    String name,
    int price,
    int weight,
    List<String> composition,
  ) async {
    try{
      await _firebaseFirestore.collection('foods').doc(doc.id).update({
        'image': image,
        'name': name,
        'price' : price,
        'weight' : weight,
        'composition' : composition,
      });
    }
    catch (e) {
      return;
    }
  }

  Future<void> deleteFoodsCollection(dynamic doc) async {
      try {
        await _firebaseFirestore.collection('foods').doc(doc.id).delete();
      } catch (e) {
        return;
      }
    }
}