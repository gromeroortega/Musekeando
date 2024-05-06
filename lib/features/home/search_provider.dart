import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  GlobalKey<FormState> search = GlobalKey<FormState>();

  String wordSearch = '';
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  isValidSearch(value) {
    if (value != null && value != '') {
      return null;
    } else {
      return 'Ingrese un titulo';
    }
  }
}
