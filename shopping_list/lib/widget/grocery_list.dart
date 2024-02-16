import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/data/categories.dart';

import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widget/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  late Future<List<GroceryItem>> _loadedItems;

  @override
  void initState() {
    super.initState();
    _loadedItems =
        _loadItems(); // Fetch data when this object is created for the 1st time
  }

  // Load the items from firebase
  Future<List<GroceryItem>> _loadItems() async {
    final url = Uri.https(
      'flutter-prep-mossosouk-default-rtdb.firebaseio.com',
      'shopping-list.json',
    );
    // try {
    final response = await http.get(url); // Send a get request to fetch data

    if (response.statusCode >= 400) {
      // statusCode >= 400 means an error has occured
      throw Exception('Failed to fetch grocey items. Please try again later.');
    }

    if (response.body == 'null') {
      // If there is no data
      // i.e if firbase returns the string 'null'

      return []; // Do not execute the above remaining code of the method
    }
    // Convert the JSON text format back to a map
    final Map<String, dynamic> listData = json.decode(response.body);

    // Convert the map listData to a list of groceries List<GroceryItem>
    final List<GroceryItem> loadedItemsList = [];
    for (var item in listData.entries) {
      final category = categories.entries
          .firstWhere(
              (catItem) => catItem.value.title == item.value['category'])
          .value;
      loadedItemsList.add(
        GroceryItem(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: category),
      );
    }
    return loadedItemsList;
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });

    // Fetch the item to be removed
    final url = Uri.https(
      'flutter-prep-mossosouk-default-rtdb.firebaseio.com',
      'shopping-list/${item.id}.json',
    );
    final response = await http.delete(url); // Delete the item

    if (response.statusCode >= 400) {
      // Schedule Snackbar display for next frame
      Timer(const Duration(milliseconds: 0), () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Something went wrong. Please try again later.'),
          ),
        );
      });
      setState(() {
        _groceryItems.insert(index, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: FutureBuilder(
        future: _loadedItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.data!.isEmpty) {
            // Fallback content
            return Center(
              child: Text(
                'No grocery items add yet...',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (ctx, index) => Dismissible(
              onDismissed: (direction) {
                _removeItem(snapshot.data![index]);
              },
              key: ValueKey(snapshot.data![index].id),
              child: ListTile(
                title: Text(snapshot.data![index].name),
                leading: Container(
                  width: 24,
                  height: 24,
                  color: snapshot.data![index].category.color,
                ),
                trailing: Text(snapshot.data![index].quantity.toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}
