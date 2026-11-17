import 'package:flutter/foundation.dart';

class FavoriteStore extends ChangeNotifier {
  final Set<String> _destinationIds = <String>{};

  bool contains(String id) => _destinationIds.contains(id);

  Set<String> get destinationIds => Set<String>.unmodifiable(_destinationIds);

  void toggle(String id) {
    if (!_destinationIds.add(id)) {
      _destinationIds.remove(id);
    }
    notifyListeners();
  }

  void reset() {
    _destinationIds.clear();
    notifyListeners();
  }
}

final favoriteStore = FavoriteStore();
