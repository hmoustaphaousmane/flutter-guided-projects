import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'package:favorite_places/models/place.dart';

var uuid = const Uuid(); // Unique id generator

class NewPlace extends StatefulWidget {
  const NewPlace({super.key});

  @override
  State<NewPlace> createState() => _NewPlaceState();
}

class _NewPlaceState extends State<NewPlace> {
  final _formKey = GlobalKey<FormState>();
  var _enteredTitle = '';

  // Method that actually saves a place
  void _savePlace() {
    // If the form is valide
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save it

      // Close (pop out) the screen and create a new place in the process
      Navigator.of(context).pop(
        Place(id: uuid.v4(), title: _enteredTitle),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50, // No more than 50 characters allowed
                decoration: const InputDecoration(
                  labelText: 'Title', // Use libelText instead of label
                ),
                // Field validation
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'Must be between 1 and 50 characters.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredTitle = value!; // Get the entered title
                },
              ),
              ElevatedButton(
                onPressed: _savePlace, // Save the place
                child: const Row(
                  // Center the row's children
                  mainAxisAlignment: MainAxisAlignment.center,

                  // Resize the row to take just the minimum required space
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 5),
                    Text('Add Place'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
