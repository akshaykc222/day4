import 'package:flutter/material.dart';
import 'package:seed_sales/componets.dart';

import '../../constants.dart';
import 'componets/categrory.dart';
import 'componets/products.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Treatment", [], context),
      body: Stack(children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: const [
              CategorySelection(),
              ProductDetails(),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: defaultButton(
                    MediaQuery.of(context).size.width * 0.6, add)))
      ]),
    );
  }
}

class AddTreatments extends StatefulWidget {
  const AddTreatments({Key? key}) : super(key: key);

  @override
  _AddTreatmentsState createState() => _AddTreatmentsState();
}

class _AddTreatmentsState extends State<AddTreatments> {
  bool isService = false;
  String taxType = "Category 1";
  var taxItems = ["Category 1", "Category 2"];
  String service = "service";
  var serItems = ["service", "products"];

  final titleController = TextEditingController();
  final purchaseController = TextEditingController();
  final mrpController = TextEditingController();
  final salespController = TextEditingController();
  final salesRController = TextEditingController();
  final expiryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          headingText("Add treatment"),
          columUserTextFileds(
              "Enter Title", "Title", TextInputType.name, titleController),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          //   child: DropdownButtonFormField(
          //     // Initial Value
          //     value: service,
          //     decoration: InputDecoration(
          //         labelText: "Category",
          //         floatingLabelBehavior: FloatingLabelBehavior.auto,
          //         border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(15))),
          //     // Down Arrow Icon
          //     icon: const Icon(Icons.keyboard_arrow_down),

          //     // Array list of items
          //     items: serItems.map((String items) {
          //       return DropdownMenuItem(
          //         value: items,
          //         child: Text(items),
          //       );
          //     }).toList(),
          //     // After selecting the desired option,it will
          //     // change button value to selected value
          //     onChanged: (String? newValue) {
          //       setState(() {
          //         service = newValue!;
          //         isService = !isService;
          //       });
          //     },
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: DropdownButtonFormField(
              // Initial Value
              value: taxType,
              decoration: InputDecoration(
                  labelText: "tax",
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: taxItems.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  taxType = newValue!;
                });
              },
            ),
          ),
          columUserTextFileds("Enter Purchase rate", "Purchase rate",
              TextInputType.number, purchaseController),
          columUserTextFileds(
              "Enter Mrp", "Mrp", TextInputType.number, mrpController),
          columUserTextFileds("Enter Sales Percentage", "Sales Percentage",
              TextInputType.number, salespController),
          columUserTextFileds("Enter Sales Rate", "Sales Rate",
              TextInputType.number, salesRController),
          columUserTextFileds("Enter Expiry date", "Expiry date",
              TextInputType.datetime, expiryController),

          // Visibility(
          //     visible: !isService, child: columUserTextFileds("Duration")),
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child:
                  defaultButton(MediaQuery.of(context).size.width * 0.5, "Add"))
        ],
      ),
    );
  }
}
