import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsersCollection {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<void> addUserCollection(
    String id,
    String image,
    String email,
    String phone,
    String name,
    String password,
  ) async {
    try {
      await _firebaseFirestore.collection('users').doc(id).set({
        'uid': id,
        'image' : image,
        'email': email,
        'phone': phone,
        'name': name,
        'password': password,
      });
    } catch (e) {
      return;
    }
  }

  Future<void> editUserCollection(
    String name,
    String image,
  ) async {
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    try {
      await _firebaseFirestore.collection('users').doc(uid).update({
        'image': image,
        'name': name,
      });
    } catch (e) {
      return;
    }
  }
    
    Future<void> deleteUserCollection(String uid) async {
      try {
        await _firebaseFirestore.collection('users').doc(uid).delete();
      } catch (e) {
        return;
      }
    }
}
