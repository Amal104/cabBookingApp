import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskiuser/Extensions/Date_Extension.dart';

class BookingProvider extends ChangeNotifier {
  TextEditingController cityTripFromController = TextEditingController();
  TextEditingController cityTripToController = TextEditingController();
  TextEditingController airportTripFromController = TextEditingController();
  TextEditingController airportTripToController = TextEditingController();
  TextEditingController outStationTripFromController = TextEditingController();
  TextEditingController outStationTripToController = TextEditingController();
  TextEditingController rentalTripFromController = TextEditingController();
  TextEditingController rentalTripToController = TextEditingController();
  String cityTemp = "";
  String airportTemp = "";
  String outstaionTemp = "";
  String rentalTemp = "";

  bool a = false;
  bool whereToGo = false;
  String cityOneWayDate = "";
  String cityReturnDate = "";
  String outStationOneWayDate = "";
  String outStationReturnDate = "";
  String airportDate = "";
  String rentalOneWayDate = "";
  String rentalReturnDate = "";

  int selectedCityCabIndex = 0;
  int selectedOutCabIndex = 0;
  int selectedAirCabIndex = 0;
  int selectedRentCabIndex = 0;
  int selectedCityTripIndex = 0;
  int selectedOutTripIndex = 0;
  int selectedAirTripIndex = 0;
  int selectedRentTripIndex = 0;
  int selectedRentHourIndex = 0;

  double starRating = 0;

  bool ratingCheckBoxValue1 = false;
  bool ratingCheckBoxValue2 = false;
  bool ratingCheckBoxValue3 = false;
  bool ratingCheckBoxValue4 = false;

  void  whereToGoPage(){
     whereToGo = true;
     notifyListeners();
  }

  void cityTripInputSwap() {
    cityTemp = cityTripFromController.text;
    cityTripFromController.text = cityTripToController.text;
    cityTripToController.text = cityTemp;
  }

   void airportTripInputSwap() {
    airportTemp = airportTripFromController.text;
    airportTripFromController.text = airportTripToController.text;
    airportTripToController.text = airportTemp;
  }

   void outStationTripInputSwap() {
    outstaionTemp = outStationTripFromController.text;
    outStationTripFromController.text = outStationTripToController.text;
    outStationTripToController.text = outstaionTemp;
  }

   void rentalTripInputSwap() {
    rentalTemp = rentalTripFromController.text;
    rentalTripFromController.text = rentalTripToController.text;
    rentalTripToController.text = rentalTemp;
  }

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

  datePicker(BuildContext context, String tripType) async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      helpText: "Select a date",
      lastDate: DateTime.now().add(const Duration(days: 45)),
      firstDate: DateTime.now(),
    );
    if (newDate == null) {
      return;
    }
    final initialTime = TimeOfDay.now().addHour(1);
    final TimeOfDay? selectedTime = await showTimePicker(
        context: context, initialTime: initialTime, helpText: "Select time");
    final dateTime = newDate.applied(selectedTime!);
    if (dateTime.isBefore(DateTime.now())) {
      print("Invalid date");
    } else {
      switch (tripType) {
        case "city":
          cityOneWayDate = DateFormat("dd-MM-yy | hh:mm a").format(dateTime);
          break;
        case "city2":
          cityReturnDate = DateFormat("dd-MM-yy | hh:mm a").format(dateTime);
          break;
        case "airport":
          airportDate = DateFormat("dd-MM-yy | hh:mm a").format(dateTime);
          break;
        case "outstation":
          outStationOneWayDate =
              DateFormat("dd-MM-yy | hh:mm a").format(dateTime);
          break;
        case "outstation2":
          outStationReturnDate =
              DateFormat("dd-MM-yy | hh:mm a").format(dateTime);
          break;
        case "rental":
          rentalOneWayDate = DateFormat("dd-MM-yy | hh:mm a").format(dateTime);
          break;
        case "rental2":
          rentalReturnDate = DateFormat("dd-MM-yy | hh:mm a").format(dateTime);
          break;
        default:
      }
      notifyListeners();
    }
  }

  changeScreen() {
    a = true;
    notifyListeners();
  }

  changeScreenback() {
    a = false;
    notifyListeners();
    if (kDebugMode) {
      print("hehehe");
    }
  }

  starRatingData(double value) {
    starRating = value;
    notifyListeners();
  }

  ratingValue1Data(bool? value) {
    ratingCheckBoxValue1 = value!;
    notifyListeners();
  }

  ratingValue2Data(bool? value) {
    ratingCheckBoxValue2 = value!;
    notifyListeners();
  }

  ratingValue3Data(bool? value) {
    ratingCheckBoxValue3 = value!;
    notifyListeners();
  }

  ratingValue4Data(bool? value) {
    ratingCheckBoxValue4 = value!;
    notifyListeners();
  }
}
