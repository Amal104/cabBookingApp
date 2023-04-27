import 'package:flutter/material.dart';

class BookingProvider extends ChangeNotifier {
  int selectedCabIndex = 0;
  int selectedTripIndex = 0;
  int selectedRentHourIndex = 0;

  void selectedCab(int index) {
    selectedCabIndex = index;
    notifyListeners();
  }

  void selectedTrip(int index) {
    selectedTripIndex = index;
    notifyListeners();
  }

  void selectedRentHour(int index) {
    selectedRentHourIndex = index;
    notifyListeners();
  }
}
