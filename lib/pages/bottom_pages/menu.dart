import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  Widget cardFood(BuildContext context, dynamic doc) {
    return Card(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(doc['name']),
          ],
        ),
        subtitle: Column(
          children: [
            Text(doc['composition'].toString(), textAlign: TextAlign.center,),
            Text(doc['weight'].toString() + 'грамм'),
            Text(doc['price'].toString() + 'руб.'),
          ],
        ),
        leading: Image.network(doc['image']),
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