import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/database/auth/model.dart';

class AuthService{
 final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

 Future<UserModel?> signIn(String email,String password) async{
  try{
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

    User user = userCredential.user!;

    return UserModel.fromFirebase(user);
  }
  catch(e){
    return null;
  }
 }

 Future<UserModel?> signUp(String email,String password) async{
  try{
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

    User user = userCredential.user!;

    return UserModel.fromFirebase(user);
  }catch(e){
    return null;
  }
 }

 Future<void> LogOut() async{
  return await _firebaseAuth.signOut();
 }

 Stream<UserModel?> get currentUser{
  return _firebaseAuth
  .authStateChanges()
  .map((user) => user!=null? UserModel.fromFirebase(user) : null);
 }
}