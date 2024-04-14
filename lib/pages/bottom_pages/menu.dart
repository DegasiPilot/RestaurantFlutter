import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/orders_collection.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  TextEditingController searchController = TextEditingController();
  final OrdersCollection orders = OrdersCollection();
  final uid = FirebaseAuth.instance.currentUser!.uid;
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
            Text(
              doc['composition'].toString(),
              textAlign: TextAlign.center,
            ),
            Text('${doc['weight']}грамм'),
            Text('${doc['price']}руб.'),
          ],
        ),
        leading: Image.network(doc['image']),
        trailing: ElevatedButton(
            onPressed: () async {
               await FirebaseFirestore.instance.collection('orders').get().then((value) async {
                  if(value.docs.any((el) => el['name'] == doc['name']))
                  {
                    dynamic editingDoc = value.docs.firstWhere((element) => element['name'] == doc['name']);
                    orders.editOrdersCollection(editingDoc, editingDoc['count'] + 1);
                  }
                  else{
                    await orders.addOrdersCollection(doc['image'], doc['name'], doc['price'], doc['weight'], doc['composition'],1, uid);
                  }
              });
            },
            child: const Icon(Icons.add_shopping_cart)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        title: TextField(
          controller: searchController,
          style: const TextStyle(color: Colors.white),
          onChanged: (value) {
            setState(() {
              value = searchController.text;
            });
          },
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('foods').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var food = snapshot.data!.docs
                .where((food) => food['name']
                        .toLowerCase()
                        .contains(searchController.text.toLowerCase())
                    ? true
                    : false)
                .toList();
            return ListView.builder(
              itemCount: food.length,
              itemBuilder: (context, index) {
                return cardFood(context, food[index]);
              },
            );
          }
        },
      ),
    );
  }
}
