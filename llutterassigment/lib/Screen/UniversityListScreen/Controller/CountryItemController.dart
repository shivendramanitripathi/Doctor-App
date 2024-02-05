import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../Model/CountryListModel.dart';
import '../../../Service/service.dart';


class UniversityScreenController extends ChangeNotifier {
  List<CountryStatusModel> countryStatusList = [];
  bool isLoading = false;
  final Logger _logger = Logger();
  final ApiService _apiService = ApiService();

  UniversityScreenController() {
    initialize();
    
  }

  Future<void> initialize() async {
    await fetchCountryStatus();
    notifyListeners();
  }

  Future<void> fetchCountryStatus() async {
    isLoading = true;
    notifyListeners();
    try {
      final List<dynamic> data = await _apiService.fetchCountryStatus();
      countryStatusList =
          data.map((json) => CountryStatusModel.fromJson(json)).toList();
    } catch (error) {
      _logger.e('Error in fetchCountryStatus: $error');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
