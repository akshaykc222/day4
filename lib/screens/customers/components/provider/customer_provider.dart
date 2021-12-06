import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seed_sales/screens/customers/models/country_model.dart';
import 'package:seed_sales/screens/customers/models/customer_model.dart';

class CustomerProvider with ChangeNotifier{
  CustomerProvider(){
    if (countryList.isEmpty) {
      initLoadCountry();
    }

  }
  List<CustomerModel> customerList=[CustomerModel(name: "akshay", billingAddress: "kodakara p.o \n manakulagara", shippingAddress: "kodakara p.o \n manakulagara", email: "akshaykc222@gmail.com", phone1: 7907017542, phone2: 7907017542, cashType: "credit", cashTypeRate: "", country: "india", state: "kerala", region: "india", zipcode: 680684, taxNumber: "#545588", payTermNum: 1, payTermType: "month", creditLimit: 50000,pendingAmt: 4500)];
  List<CountryModel> countryList=[];
  CountryModel? selectedModel;
  void setList(CustomerModel model){
    customerList.add(model);
    notifyListeners();
  }

  void delete(CustomerModel model){
    customerList.remove(model);
    notifyListeners();
  }
  void update(CustomerModel model){
    //customerList.
  }
  void initLoadCountry() async{
    var jsonTxt=await rootBundle.loadString('assets/files/countrylist.json');

    countryList=countryFromJson(jsonTxt);
    selectedModel=countryList.first;
    notifyListeners();
  }
  void setSelectedCountry(CountryModel model){
    selectedModel=model;
    notifyListeners();
  }

}