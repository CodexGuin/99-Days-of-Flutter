import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_10/providers/shopping_provider.dart';
import 'package:provider/provider.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
          Expanded(
              child: ListView.builder(
                  itemCount: context.watch<ShoppingProvider>().cartItems.length,
                  itemBuilder: (context, index) {
                    return ItemView(
                        itemName: context
                            .watch<ShoppingProvider>()
                            .cartItems[index]['name'] as String,
                        index: index,
                        itemCount: context
                            .watch<ShoppingProvider>()
                            .cartItems[index]['count'] as int);
                  })),
          const Divider(),
          Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                  'Total items: ${context.watch<ShoppingProvider>().totalItems}',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w300)))
        ])),
        floatingActionButton: FloatingActionButton(
            onPressed: context.read<ShoppingProvider>().clearCart,
            child: const Icon(Icons.remove_shopping_cart_outlined)));
  }
}

class ItemView extends StatelessWidget {
  final String itemName;
  final int itemCount, index;

  const ItemView(
      {super.key,
      required this.itemName,
      required this.itemCount,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.shopping_cart),
        title: Text(itemName),
        trailing: Row(mainAxisSize: MainAxisSize.min, children: [
          Text(
              '\$${context.watch<ShoppingProvider>().cartItems[index]['price']}'),
          IconButton(
              onPressed: () =>
                  context.read<ShoppingProvider>().decrement(index),
              icon: const Icon(Icons.remove)),
          Text(itemCount.toString()),
          IconButton(
              onPressed: () =>
                  context.read<ShoppingProvider>().increment(index),
              icon: const Icon(Icons.add))
        ]));
  }
}
