import 'package:flutter/material.dart';
import 'package:seed_sales/screens/Desingation/models/designation_model.dart';

class DesignationProvider with ChangeNotifier {
  List<DesingationModel> designationList = [];
  List<DesingationModel> getDesignationList() => designationList;
  void addDesignation(DesingationModel model) {
    designationList.add(model);
    notifyListeners();
  }

  bool deleteDesingation(DesingationModel model) {
    if (designationList.contains(model)) {
      designationList.remove(model);
      return true;
    } else {
      return false;
    }
  }
}
