import 'package:flutter/material.dart';

class ChatsListVm extends ChangeNotifier {
  bool _isSearchActive = false;
  final TextEditingController _searchController = TextEditingController();

  bool get isSearchActive => _isSearchActive;
  TextEditingController get searchController => _searchController;

  void clearController() {
    _searchController.text = '';
    updateIsSearchActive(false);
  }

  // update value of isSearchActive
  void updateIsSearchActive(final bool newVal) {
    _isSearchActive = newVal;
    notifyListeners();
  }
}
