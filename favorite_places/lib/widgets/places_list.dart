import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/widgets/new_place.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatefulWidget {
  const PlacesList({super.key});

  @override
  State<PlacesList> createState() => _PlacesListState();
}

class _PlacesListState extends State<PlacesList> {
  final List<Place> _places = []; // List of places

  // Fonction that adds a place to the list
  void _addPlace() async {
    // Display the new place screen to add a new place
    final place = await Navigator.of(context).push<Place>(
      MaterialPageRoute(
        builder: (ctx) => const NewPlace(),
      ),
    );

    if (place == null) {
      return;
    }
    setState(() {
      _places.add(place); // Add the place to the list of places
    });
  }

  @override
  Widget build(BuildContext context) {
    // If the list of places is empty, show a fallback text
    Widget content = Center(
      child: Text(
        'No places added yet',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );

    // If not, display the list
    if (_places.isNotEmpty) {
      content = ListView.builder(
        itemCount: _places.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(_places[index].title),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          // Action that render's the new place's screen
          IconButton(onPressed: _addPlace, icon: const Icon(Icons.add))
        ],
      ),
      body: content,
    );
  }
}
