import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed_sales/componets.dart';
import 'package:seed_sales/constants.dart';
import 'package:seed_sales/screens/customers/components/provider/customer_provider.dart';
import 'package:seed_sales/screens/customers/models/country_model.dart';

class CustomerListForm extends StatefulWidget {
  const CustomerListForm({Key? key}) : super(key: key);

  @override
  State<CustomerListForm> createState() => _CustomerListFormState();
}

class _CustomerListFormState extends State<CustomerListForm> {

  final nameController =TextEditingController();
  final addressController =TextEditingController();
  final shippingAddressController=TextEditingController();
  final mailController=TextEditingController();
  final contact1Controller=TextEditingController();
  final contact2Controller=TextEditingController();
  final countryController=TextEditingController();
  final stateController=TextEditingController();
  final zipcodeController=TextEditingController();
  final taxNumController =TextEditingController();
  final payTermController=TextEditingController();
  final creditLimitController=TextEditingController();
  String selectedRegion="india";
  bool sameAddress=false;
  List<String> regionList=["india","dubai"];
  String selectedPayTerm="month";
  List<String> payTerm=["day","month","year"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Add customer", [], context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          child: Column(
            children: [
                columUserTextFileds("Enter Full Name", "Full Name", TextInputType.name, nameController),
                columUserTextFileds("Enter Address", "Address", TextInputType.multiline, addressController),
                columUserTextFileds("Enter Contact Number", "Contact Number", TextInputType.name, nameController),
                columUserTextFileds("Enter Alternative Contact Number", "Alternative Contact Number (optional)", TextInputType.name, nameController),
                Consumer<CustomerProvider>(

                  builder: (context, snapshot,child) {
                    return snapshot.countryList.isEmpty?Container(): Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    child: Theme(
                      data:  Theme.of(context).copyWith(
                        canvasColor: lightBlack,
                      ),
                      child: DropdownButtonFormField(
                        // Initial Value
                        style: textStyle(16,  FontWeight.bold),
                        value: snapshot.selectedModel,
                        decoration:   InputDecoration(
                            labelText: "Country",
                            labelStyle: textStyle(18, FontWeight.normal),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: whiteColor)
                            ),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: whiteColor)
                          ),
                          enabledBorder:  const UnderlineInputBorder(
                              borderSide: BorderSide(color: whiteColor)
                          ),

                        ),

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down,color: whiteColor,),

                        // Array list of items
                        items: snapshot.countryList.map((e) {
                          return DropdownMenuItem<CountryModel>(
                            value: e,
                            child: Container( color: lightBlack,child: Text(e.name,style: const TextStyle(color: whiteColor),)),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (CountryModel? value) {
                            snapshot.setSelectedCountry(value!);
                        },
                      ),
                    ),
                 );
                  }
                ),
              columUserTextFileds("Enter ZipCode", "eg :680684", TextInputType.number, zipcodeController),
              columUserTextFileds("Enter State Name", "eg :kerala", TextInputType.name, stateController),
              columUserTextFileds("Enter Tax number", "eg :#dfgdfgdg", TextInputType.none, taxNumController),
              spacer(10),
              const Divider(color: whiteColor,),
               Text('Shipping address',style: textStyle(18, FontWeight.normal),),
              Row(
                children: [
                  const SizedBox(width: 25,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Same address as above',style: textStyle(18, FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Checkbox(
                      side: const BorderSide(color: whiteColor),
                        value: sameAddress, onChanged: (value){
                          setState(() {
                            sameAddress=!sameAddress;
                          });
                    }),
                  ),
                ],
              ),
              spacer(10),
              Visibility(
                visible: !sameAddress,
                  child: Column(
                children: [
                  columUserTextFileds("Enter Contact Number", "Contact Number", TextInputType.name, nameController),
                  columUserTextFileds("Enter Alternative Contact Number", "Alternative Contact Number (optional)", TextInputType.name, nameController),
                  Consumer<CustomerProvider>(

                      builder: (context, snapshot,child) {
                        return snapshot.countryList.isEmpty?Container(): Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                          child: Theme(
                            data:  Theme.of(context).copyWith(
                              canvasColor: lightBlack,
                            ),
                            child: DropdownButtonFormField(
                              // Initial Value
                              style: textStyle(16,  FontWeight.bold),
                              value: snapshot.selectedModel,
                              decoration:   InputDecoration(
                                labelText: "Country",
                                labelStyle: textStyle(18, FontWeight.normal),
                                floatingLabelBehavior: FloatingLabelBehavior.auto,
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: whiteColor)
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: whiteColor)
                                ),
                                enabledBorder:  const UnderlineInputBorder(
                                    borderSide: BorderSide(color: whiteColor)
                                ),

                              ),

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down,color: whiteColor,),

                              // Array list of items
                              items: snapshot.countryList.map((e) {
                                return DropdownMenuItem<CountryModel>(
                                  value: e,
                                  child: Container( color: lightBlack,child: Text(e.name,style: const TextStyle(color: whiteColor),)),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (CountryModel? value) {
                                snapshot.setSelectedCountry(value!);
                              },
                            ),
                          ),
                        );
                      }
                  ),
                  columUserTextFileds("Enter ZipCode", "eg :680684", TextInputType.number, zipcodeController),
                  columUserTextFileds("Enter State Name", "eg :kerala", TextInputType.name, stateController),
                ],
              )),
              const Divider(color: whiteColor,),

              const Text('Pay Term',style: TextStyle(color: whiteColor,fontWeight: FontWeight.bold,fontSize: 18),),
              Row(
                children: [
                  const SizedBox(width: 25,),
                  SizedBox(
                    width: 150,
                    height: 110,
                    child: columUserTextFileds("Pay term", "eg :1", TextInputType.name, stateController)
                  ),
                  SizedBox(
                    width: 150,
                    height: 100,
                    child: Theme(
                      data:  Theme.of(context).copyWith(
                        canvasColor: lightBlack,
                      ),
                      child: DropdownButtonFormField(
                        // Initial Value
                        style: textStyle(16,  FontWeight.bold),
                        value: selectedPayTerm,
                        decoration:   InputDecoration(
                          labelText: "Duration",
                          labelStyle: textStyle(18, FontWeight.normal),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: whiteColor)
                          ),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: whiteColor)
                          ),
                          enabledBorder:  const UnderlineInputBorder(
                              borderSide: BorderSide(color: whiteColor)
                          ),

                        ),

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down,color: whiteColor,),

                        // Array list of items
                        items: payTerm.map((e) {
                          return DropdownMenuItem<String>(
                            value: e,
                            child: Container( color: lightBlack,child: Text(e,style: const TextStyle(color: whiteColor),)),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? value) {
                          setState(() {
                            selectedPayTerm=value!;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),

              Consumer<CustomerProvider>(

                  builder: (context, snapshot,child) {
                    return snapshot.countryList.isEmpty?Container(): Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      child: Theme(
                        data:  Theme.of(context).copyWith(
                          canvasColor: lightBlack,
                        ),
                        child: DropdownButtonFormField(
                          // Initial Value
                          style: textStyle(16,  FontWeight.bold),
                          value: snapshot.selectedModel,
                          decoration:   InputDecoration(
                            labelText: "Currency",
                            labelStyle: textStyle(18, FontWeight.normal),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            border: const UnderlineInputBorder(
                                borderSide: BorderSide(color: whiteColor)
                            ),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: whiteColor)
                            ),
                            enabledBorder:  const UnderlineInputBorder(
                                borderSide: BorderSide(color: whiteColor)
                            ),

                          ),

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down,color: whiteColor,),

                          // Array list of items
                          items: snapshot.countryList.map((e) {
                            return DropdownMenuItem<CountryModel>(
                              value: e,
                              child: Text(e.currency,style: const TextStyle(color: whiteColor,fontSize: 18,fontWeight: FontWeight.bold),),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (CountryModel? value) {
                            snapshot.setSelectedCountry(value!);
                          },
                        ),
                      ),
                    );
                  }
              ),
              columUserTextFileds("Enter Credit limit", "50000", TextInputType.number, nameController),
              spacer(10),
              defaultButton(MediaQuery.of(context).size.width*0.5, "Save"),
              spacer(10)
            ],
          ),
        ),
      ),
    );
  }
}
