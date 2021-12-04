import 'package:flutter/material.dart';
import 'package:seed_sales/componets.dart';
import 'package:seed_sales/constants.dart';
import 'package:seed_sales/screens/customers/models/customer_model.dart';
import 'package:seed_sales/sizeconfig.dart';

class CustomerList extends StatelessWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithSearch(context, customers),
      body: ListView.builder(
        itemCount: 3,
          itemBuilder: (_,index){
            return const CustomerListTile();
          }
      ),
    );
  }
}
class CustomerListTile extends StatelessWidget {
  final CustomerModel model;
  const CustomerListTile({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: SizeConfig.blockSizeVertical!*15,
        decoration: BoxDecoration(
          color: black90,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Text(model.name,style: textStyle(SizeConfig.blockSizeHorizontal!*1.5, FontWeight.bold),),

          ],
        ),
      ),
    );
  }
}
