import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/database/auth/service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:const FirebaseOptions(
    apiKey: 'AIzaSyANtkoPiT_tKcqzCVWPsAVnR2_0ntZr2mc', 
    appId: '1:875578923612:android:eab4d056f1a1f074ce2499', 
    messagingSenderId: '875578923612',
    projectId:'restarauntnigmatov',
    storageBucket: 'restarauntnigmatov.appspot.com'));
    runApp(const ThemeAppMenu());
}

class ThemeAppMenu extends StatelessWidget {
  const ThemeAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
      return StreamProvider.value(
      initialData: null,
      value: AuthService().currentUser,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}