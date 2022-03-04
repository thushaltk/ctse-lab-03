import 'package:ctse_lab03/data.dart';
import 'package:flutter/material.dart';

//This is the class that we are going to keep our state ON
//Using the provider, we keep our state outside the widget tree
//Because we are going to add items to the cart from the home and see the list of the items and the total price from the cart screen
//which are two independent widgets.
// Ex: Home as stateful component but can not access the state in the cart page
class CartProvider extends ChangeNotifier {
  final Set<Item> _items = {};

  //Get set of items
  Set<Item> get items => _items;

  double get total => _items.fold(
      0.0,
      (previousValue, item) =>
          previousValue + item.price); //0.0 is initial value

  bool isItemAdded(Item item) {
    //return a boolean
    return _items.contains(item);
  }

  void addItem(Item item) {
    _items.add(item);
    notifyListeners(); // Instead of this in stateful widgets when we do a change for the state, we use setState method to notify it to the flutter,
    // That responsible is done by this notifyListeners() method
  }

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}
