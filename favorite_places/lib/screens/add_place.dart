import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {

  @override
  Widget build(BuildContext context) {
    final _titleController = TextEditingController();

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
              style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              onPressed: () {}, // Save the place
              icon: const Icon(Icons.add),
              label: const Text('Add Place'),
            ),
          ],
        ),
      ),
    );
  }
}
