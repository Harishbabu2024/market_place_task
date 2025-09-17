import 'package:flutter/foundation.dart';
import 'package:market_place_task/service/api_service.dart';

class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final ApiService apiService = ApiService();
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
