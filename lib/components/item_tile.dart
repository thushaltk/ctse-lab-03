import 'package:ctse_lab03/data.dart';
import 'package:ctse_lab03/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemTile extends StatelessWidget {
  final Item item;

  const ItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool cantAdded = Provider.of<CartProvider>(context).isItemAdded(item);

    return Card(
      elevation: 5,
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              item.image,
            ),
          ),
          Text(
            item.name,
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            item.price.toStringAsFixed(2),
            style: Theme.of(context).textTheme.caption,
          ),
          IconButton(
              onPressed: cantAdded
                  ? null
                  : () {
                      Provider.of<CartProvider>(context, listen: false)
                          .addItem(item);
                    },
              icon: const Icon(Icons.add_shopping_cart))
        ],
      ),
    );
  }
}
