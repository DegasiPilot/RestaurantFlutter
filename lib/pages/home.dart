import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/database/auth/service.dart';
import 'package:flutter_application_1/pages/bottom_pages/menu.dart';
import 'package:flutter_application_1/pages/bottom_pages/order.dart';
import 'package:flutter_application_1/pages/bottom_pages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = new TextEditingController();
  String title = "Меню";
  int index = 0;
  final pages = [const MenuPage(), const OrderPage(), const ProfilePage()];
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();

    AppBar appBar = AppBar(
      actions: [
        IconButton(
          onPressed: () async {
            await authService.LogOut();
            Navigator.popAndPushNamed(context, "/");
          },
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              isSearch = true;
            });
          },
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ],
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
    AppBar searchBar = AppBar(
      leading: const Icon(Icons.search, color: Colors.white,),
      title : TextField(controller: searchController,),
      actions: [
        IconButton(onPressed: (){
          setState(() {
            isSearch = false;
          });
        }, 
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        )
        ),
      ],
    );
    return Scaffold(
      appBar: isSearch ? searchBar : appBar,
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
            if (index == 0) {
              title = "Меню";
            } else if (index == 1) {
              title = "Заказы";
            } else if (index == 2) {
              title = "Профиль";
            }
          });
        },
      ),
    );
  }
}
