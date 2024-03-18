import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/auth/service.dart';
import 'package:flutter_application_1/pages/bottom_pages/menu.dart';
import 'package:flutter_application_1/pages/bottom_pages/order.dart';
import 'package:flutter_application_1/pages/bottom_pages/profile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = "Меню";
  int index = 0;
  final pages = [const MenuPage(), const OrderPage(), const ProfilePage()];
  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () async {
          await authService.LogOut();
          Navigator.popAndPushNamed(context, "/");
        },
        icon: const Icon(Icons.logout, color: Colors.white,))],
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: pages.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Меню",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: "Заказ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Профиль",
          ),
        ],
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
            if(index == 0){
              title = "Меню";
            }
            else if(index == 1){
              title = "Заказы";
            }
            else if(index == 2){
              title = "Профиль";
            }
          });
        },
      ),
    );
  }
}