import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  TextEditingController searchController = TextEditingController();
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
