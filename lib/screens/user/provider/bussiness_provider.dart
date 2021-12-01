import 'package:flutter/material.dart';

class BussinessProvider with ChangeNotifier {
  List<String> bussinesList = [
    "business1",
    "bussiness2",
    "bussiness3",
    "bussiness4"
  ];
  get getBussinessList => bussinesList;

  String selectedBusiness = "business1";

  void setDropDownValue(String value) {
    selectedBusiness = value;
    notifyListeners();
  }

  List<String> selectedBussinessList = [];

  void setSelectedBussiness() {
    if (selectedBussinessList.contains(selectedBusiness)) {
      selectedBussinessList.remove(selectedBusiness);
    }
    selectedBussinessList.add(selectedBusiness);
    notifyListeners();
  }

  List<String> listSelectedBusiness() => selectedBussinessList;
}
