import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  Widget cardFood(BuildContext context, dynamic doc) {
    return Card(
      child: ListTile(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Блюдо'),
          ],
        ),
        subtitle: const Column(
          children: [
            Text('Описание'),
            Text('200 грамм'),
          ],
        ),
        leading: Image.asset('images/logo.png'),
        trailing: ElevatedButton(
            onPressed: () {}, child: const Icon(Icons.add_shopping_cart)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('foods').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: ((context, index) {
                return cardFood(context, snapshot.data!.docs[index]);
              }),
            );
          }
        },
      ),
    );
  }
}