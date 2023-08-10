import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/country_model.dart';
import 'package:untitled/network/api_service.dart';
import 'package:untitled/repository/repository_service.dart';

class ProviderService extends ChangeNotifier {
  bool isLoading = false;

  notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
