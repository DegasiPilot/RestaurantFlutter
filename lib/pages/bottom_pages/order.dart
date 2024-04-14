import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/database/orders_collection.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final OrdersCollection orders = OrdersCollection();

  Widget orderCard(BuildContext context, dynamic doc) {
    return Card(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(doc['name'], textAlign: TextAlign.center,),
          ],
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(doc['composition'].toString()),
            Text(doc['weight'].toString()),
            Text('${doc['price']}руб.'),
            Row(
            children: <Widget>[
              ElevatedButton(
                  onPressed: () => setState(() {
                        if (doc['count'] > 1) {
                          orders.editOrdersCollection(doc, doc['count'] - 1);
                        }
                      }),
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 18),
                  )),
              const SizedBox(
                width: 5,
                height: 15,
              ),
              Text(
                doc['count'].toString(),
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                width: 5,
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () => setState(() {
                        orders.editOrdersCollection(doc, doc['count'] + 1);
                      }),
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 18),
                  )),
            ],
          ),
          ],
        ),
        leading: Image.network(doc['image'])
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('orders').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var orders = snapshot.data!.docs.where((order) => order['uid'] == uid).toList();
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return orderCard(context, orders[index]);
              },
            );
          }
        },
      ),
      bottomSheet: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('Перейти к оплате'),
            ),
          ),
        ],
      ),
    );
  }
}
