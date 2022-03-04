
import 'package:ctse_lab03/data.dart';
import 'package:ctse_lab03/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  static String routeName = "/cart";

  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Set<Item> items = Provider.of<CartProvider>(context).items;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 9,
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  // Index is the Iterator
                  Item item = items.elementAt(index);
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.price.toStringAsFixed(2)),
                      trailing: IconButton(
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .removeItem(item);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  );
                }),
          ),
          Flexible(
              flex: 1,
              child: Text(
                'Total ${Provider.of<CartProvider>(context).total.toStringAsFixed(2)} ',
                style: Theme.of(context).textTheme.headline5,
              ))
        ],
      ),
    );
  }
}
