import 'package:flutter/material.dart';

class BookingProvider extends ChangeNotifier {
  int selectedCabIndex = 0;
  int selectedTripIndex = 0;

  void selectedCab(int index) {
    selectedCabIndex = index;
    notifyListeners();
  }

  void selectedTrip(int index) {
    selectedTripIndex = index;
    notifyListeners();
  }
}
