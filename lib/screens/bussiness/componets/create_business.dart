import 'package:flutter/material.dart';

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
  String selectRegion = "india";
  List<String> regionList = ["india", "dubai"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // columUserTextFileds("Branch Under"),
        columUserTextFileds("Enter Business Name", "Bussiness name",
            TextInputType.name, bussinessController),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: DropdownButtonFormField(
            style: const TextStyle(color: textColor),
            value: selectRegion,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: textColor,
            ),
            decoration: const InputDecoration(
                labelText: "Region",
                labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                hintStyle: TextStyle(color: textColor),
                filled: true,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white30,
                    width: 2.0,
                  ),
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white30)),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white30))),
            items: regionList
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                selectRegion = value!;
              });
            },
          ),
        ),
        columUserTextFileds("Enter Address", "Address",
            TextInputType.streetAddress, addressController),
        columUserTextFileds("Enter Pincode", "Pin code", TextInputType.number,
            pincodeController),
        columUserTextFileds("Enter Country name", "Country", TextInputType.name,
            countryController),
        columUserTextFileds(
            "Enter State name", "State", TextInputType.name, stateController),
        columUserTextFileds(
            "Enter City name", "City", TextInputType.name, cityController),
        columUserTextFileds("Enter tax number", "Tax number",
            TextInputType.none, taxController),
        defaultButton(MediaQuery.of(context).size.width * 0.6, create)
      ],
    );
  }
}
