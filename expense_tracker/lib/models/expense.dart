import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart'; // Use a third party package to generate ids
import 'package:intl/intl.dart'; // Third party that provides date formatter and bunch of other feature

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); // Generate a unique string id
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final String category;

  String get formattedDate {
    return formatter.format(date);
  }
}
