import 'package:flutter/material.dart';

class BookingProvider extends ChangeNotifier {
  int selectedCityCabIndex = 0;
  int selectedOutCabIndex = 0;
  int selectedAirCabIndex = 0;
  int selectedRentCabIndex = 0;
  int selectedCityTripIndex = 0;
  int selectedOutTripIndex = 0;
  int selectedAirTripIndex = 0;
  int selectedRentTripIndex = 0;
  int selectedRentHourIndex = 0;

  void selectedCityCab(int index) {
    selectedCityCabIndex = index;
    notifyListeners();
  }

  void selectedOutCab(int index) {
    selectedOutCabIndex = index;
    notifyListeners();
  }

  void selectedAirCab(int index) {
    selectedAirCabIndex = index;
    notifyListeners();
  }

  void selectedRentCab(int index) {
    selectedRentCabIndex = index;
    notifyListeners();
  }

  void selectedCityTrip(int index) {
    selectedCityTripIndex = index;
    notifyListeners();
  }

  void selectedOutTrip(int index) {
    selectedOutTripIndex = index;
    notifyListeners();
  }

  void selectedAirTrip(int index) {
    selectedAirTripIndex = index;
    notifyListeners();
  }

  void selectedRentTrip(int index) {
    selectedRentTripIndex = index;
    notifyListeners();
  }

  void selectedRentHour(int index) {
    selectedRentHourIndex = index;
    notifyListeners();
  }
}
