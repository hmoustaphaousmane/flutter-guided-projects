import 'package:uuid/uuid.dart';

const uuid = Uuid(); // Unique id generator

class Place {
  Place({required this.title}) : id = uuid.v4();

  final String id;
  final String title;
}
