import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/widgets/new_place.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key});

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          // Action that render's the new place's screen
          IconButton(onPressed: _addPlace, icon: const Icon(Icons.add))
        ],
      ),
      body: const PlacesList(places: [],),
    );
  }
}
