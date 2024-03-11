import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(flex: 3,),
            Icon(Icons.person),
            Spacer(),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Никнейм',
                enabled: false,
              ),
            ),
            Spacer(),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email',
                enabled: false,
              ),
            ),
            Spacer(),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Телефон',
                enabled: false,
              ),
            ),
            Spacer(),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Пароль',
                enabled: false,
              ),
            ),
            Spacer(flex: 3,),
          ],
        ),
      ),
    );
  }
}
