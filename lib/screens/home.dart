import 'package:flutter/material.dart';

import '../components/item_tile.dart';
import '../data.dart';
import 'cart.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Store"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Cart.routeName);
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: storeItems.length,
              itemBuilder: (context, index) {
                return ItemTile(item: storeItems.elementAt(index));
              }),
        ) // We want to iterate through list of items,

        );
  }
}
