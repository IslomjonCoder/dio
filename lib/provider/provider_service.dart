import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/country_model.dart';
import 'package:untitled/network/api_service.dart';
import 'package:untitled/repository/repository_service.dart';

class ProviderService extends ChangeNotifier {
  final ApiRepository _repository = ApiRepository();
  final ApiService _service = ApiService();
  bool isLoading = false;
  List<CountryModel> countries = [];
  ProviderService() {
    getCountries();
  }

  getCountries() async {
    notify(true);
    final response = await _service.getCountries();
    if (response.isSuccess) {
      countries = response.data;
    } else {
      print(response.errorMessage);
    }
    notify(false);
  }

  notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
