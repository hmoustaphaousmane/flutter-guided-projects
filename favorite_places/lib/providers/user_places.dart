import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/models/place.dart';

class UserPacersNotifier extends StateNotifier<List<Place>> {
  UserPacersNotifier() : super(const []);

  void addPlace(String title) {
    final newPlace = Place(title: title);
    state = [newPlace, ...state];
  }
}

final userPlacesProvider = StateNotifierProvider<UserPacersNotifier, List<Place>>(
  (ref) => UserPacersNotifier(),
);
