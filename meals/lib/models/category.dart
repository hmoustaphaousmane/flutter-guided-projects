import 'package:flutter/material.dart';

// Define a category
class Category {
  // Constructor funstion
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  // A category's attributes
  final String id;
  final String title;
  final Color color;
}
