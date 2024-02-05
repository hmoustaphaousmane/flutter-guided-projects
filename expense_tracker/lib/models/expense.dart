import 'package:uuid/uuid.dart'; // Use a third party package to generate ids

const uuid = Uuid();

enum Category { food, travel, leasure, work }

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
}
