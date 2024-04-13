import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  int itemQnt = 1;
  final String uid = FirebaseAuth.instance.currentUser!.uid;

  Future<Widget> orderCard(BuildContext context, dynamic doc) async {
    return Card(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(doc['name'], textAlign: TextAlign.center,),
          ],
        ),
        subtitle: Column(
          children: [
            Text(doc['composition'].toString()),
            Text(doc['weight'].toString()),
            Text('${doc['price']}руб.'),
          ],
        ),
        leading: Image.network(doc['image']),
        trailing: SizedBox(
          width: 150,
          height: 200,
          child: Row(
            children: <Widget>[
              ElevatedButton(
                  onPressed: () => setState(() {
                        if (itemQnt == 1) {
                        } else {
                          itemQnt--;
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
                itemQnt.toString(),
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                width: 5,
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () => setState(() {
                        itemQnt++;
                      }),
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 18),
                  )),
            ],
          ),
        ),
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
                FutureBuilder(future: orderCard(context, orders[index]),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    return snapshot.requireData;
                  }
                  else{
                    return const Text("Загрузка...");
                  }
                },
                );
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
