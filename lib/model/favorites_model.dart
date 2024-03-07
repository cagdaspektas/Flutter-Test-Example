import 'package:flutter/material.dart';

class Favorites extends ChangeNotifier {
  final List<int> _favorites = [];

  List<int> get items => _favorites;

  void add(int no) {
    _favorites.add(no);
    notifyListeners();
  }

  void delete(int no) {
    _favorites.remove(no);
    notifyListeners();
  }
}
