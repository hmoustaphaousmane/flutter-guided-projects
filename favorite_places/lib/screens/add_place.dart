import 'dart:io';

import 'package:favorite_places/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/providers/user_places.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    final _titleController = TextEditingController();
    File? _selectedImange;

    void _savePlace() {
      final entredTitle = _titleController.text;

      if (entredTitle == 'null' ||
          entredTitle.isEmpty ||
          _selectedImange == null) {
        return;
      }

      ref
          .read(userPlacesProvider.notifier)
          .addPlace(entredTitle, _selectedImange!);

      Navigator.of(context).pop();
    }

    @override
    void dispose() {
      _titleController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              maxLength: 50, // No more than 50 characters allowed
              decoration: const InputDecoration(
                labelText: 'Title', // Use libelText instead of label
              ),
              controller: _titleController,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 10),
            // Image input
            ImageInput(
              onPickImage: (image) {
                _selectedImange = image;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _savePlace, // Save the place
              icon: const Icon(Icons.add),
              label: const Text('Add Place'),
            ),
          ],
        ),
      ),
    );
  }
}
