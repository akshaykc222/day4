import 'package:flutter/cupertino.dart';
import 'package:seed_sales/screens/customers/models/customer_model.dart';

class CustomerProvider with ChangeNotifier {
  List<CustomerModel> customerList = [];

  void setList(CustomerModel model) {
    customerList.add(model);
    notifyListeners();
  }

  
}
