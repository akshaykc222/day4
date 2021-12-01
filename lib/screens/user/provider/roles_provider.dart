import 'package:flutter/material.dart';

class RoleProvider with ChangeNotifier {
  List<String> roleList = ["staff", "manager", "custom role 1"];
  List<String> selectedRoleList = ["staff", "manager", "custom role 1"];
  String selectedDropdownvalue = "staff";
  void setSelectedList(String item) {
    selectedDropdownvalue = item;
    notifyListeners();
  }
}
