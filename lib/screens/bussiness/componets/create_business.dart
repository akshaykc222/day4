import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed_sales/screens/bussiness/models/bussinessmode.dart';
import 'package:seed_sales/screens/bussiness/provider/business_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../componets.dart';
import '../../../constants.dart';

class CreateBussiness extends StatefulWidget {
  const CreateBussiness({Key? key}) : super(key: key);

  @override
  _CreateBussinessState createState() => _CreateBussinessState();
}

class _CreateBussinessState extends State<CreateBussiness> {
  final bussinessController = TextEditingController();
  final addressController = TextEditingController();
  final pincodeController = TextEditingController();
  final countryController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final taxController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String selectRegion = "india";
  List<String> regionList = ["india", "dubai"];

  _upload() {
    print('seleff');
    if (formKey.currentState!.validate()) {
      var uuid = Uuid();
      String id = uuid.v1();
      BusinessModel model = BusinessModel(
          id: id,
          name: bussinessController.text,
          address: addressController.text,
          pincode: pincodeController.text,
          country: countryController.text,
          state: stateController.text,
          city: cityController.text,
          tax: taxController.text,
          tax1: "");
      Provider.of<BusinessProvider>(context, listen: false)
          .addToFirebase(model, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          // columUserTextFileds("Branch Under"),
          columUserTextFileds("Enter Business Name", "Bussiness name",
              TextInputType.name, bussinessController),
          columUserTextFileds("Enter Address", "Address",
              TextInputType.streetAddress, addressController),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          //   child: DropdownButtonFormField(
          //     style: const TextStyle(color: textColor),
          //     value: selectRegion,
          //     icon: const Icon(
          //       Icons.keyboard_arrow_down,
          //       color: textColor,
          //     ),
          //     decoration: const InputDecoration(
          //         labelText: "Region",
          //         labelStyle: TextStyle(
          //             fontSize: 20,
          //             fontWeight: FontWeight.bold,
          //             color: textColor),
          //         floatingLabelBehavior: FloatingLabelBehavior.auto,
          //         hintStyle: TextStyle(color: textColor),
          //         filled: true,
          //         enabledBorder: UnderlineInputBorder(
          //           borderSide: BorderSide(
          //             color: Colors.white30,
          //             width: 2.0,
          //           ),
          //         ),
          //         disabledBorder: UnderlineInputBorder(
          //             borderSide: BorderSide(color: Colors.white30)),
          //         border: UnderlineInputBorder(
          //             borderSide: BorderSide(color: Colors.white30))),
          //     items: regionList
          //         .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          //         .toList(),
          //     onChanged: (String? value) {
          //       setState(() {
          //         selectRegion = value!;
          //       });
          //     },
          //   ),
          // ),

          columUserTextFileds("Enter Pincode", "Pin code", TextInputType.number,
              pincodeController),
          columUserTextFileds("Enter Country name", "Country",
              TextInputType.name, countryController),
          columUserTextFileds(
              "Enter State name", "State", TextInputType.name, stateController),
          columUserTextFileds(
              "Enter City name", "City", TextInputType.name, cityController),
          columUserTextFileds("Enter tax number", "Tax number",
              TextInputType.name, taxController),
          InkWell(
              onTap: () {
                _upload();
              },
              child: defaultButton(
                  MediaQuery.of(context).size.width * 0.6, create))
        ],
      ),
    );
  }
}
