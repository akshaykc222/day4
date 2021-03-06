import 'package:flutter/material.dart';
import 'package:seed_sales/componets.dart';

import '../../constants.dart';
import '../../sizeconfig.dart';
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
          headingText("Add Product"),
          columUserTextFiledsBlack(
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
          columUserTextFiledsBlack("Enter Purchase rate", "Purchase rate",
              TextInputType.number, purchaseController),
          columUserTextFiledsBlack(
              "Enter MRP", "MRP", TextInputType.number, mrpController),
          columUserTextFiledsBlack("Enter Sales Percentage", "Sales Percentage",
              TextInputType.number, salespController),
          columUserTextFiledsBlack("Enter Sales Rate", "Sales Rate",
              TextInputType.number, salesRController),
          columUserTextFiledsBlack("Enter Tax Rate", "Tax Rate",
              TextInputType.number, salesRController),
          columUserTextFiledsBlack("Enter Expiry date", "Expiry date",
              TextInputType.datetime, expiryController),
         const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Product Images',style: TextStyle(color: blackColor,fontWeight: FontWeight.bold,fontSize: 18),),
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: Container(
              color: Colors.grey,
              child:const Center(
                child: Icon(Icons.add_a_photo_outlined),
              ),
            ),
          ),
          spacer(10),
          // Visibility(
          //     visible: !isService, child: columUserTextFileds("Duration")),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              defaultButton(SizeConfig.screenWidth!*0.5, add),

              InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child:const Text(cancel,style: TextStyle(color: blackColor),))
            ],
          ),
          spacer(10)
        ],
      ),
    );
  }
}
