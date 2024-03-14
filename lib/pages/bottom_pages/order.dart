import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  int itemQnt = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
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
              trailing: SizedBox(
                width: 150,
                height: 200,
                child: Row(
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () => setState(() {
                              if (itemQnt == 1) {
                              } 
                              else {
                                itemQnt--;
                              }
                            }),
                        child: const Text('-',style: TextStyle(fontSize: 18),)),
                    const SizedBox(
                      width: 5,
                      height: 15,
                    ),
                    Text(itemQnt.toString(), style: const TextStyle(fontSize: 18),),
                    const SizedBox(
                      width: 5,
                      height: 15,
                    ),
                    ElevatedButton(
                        onPressed: () => setState(() {
                              itemQnt++;
                            }),
                        child: const Text('+',style: TextStyle(fontSize: 18),)),
                  ],
                ),
              ),
            ),
          ),
        ],
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
