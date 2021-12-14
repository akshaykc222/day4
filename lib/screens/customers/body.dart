import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:seed_sales/componets.dart';
import 'package:seed_sales/constants.dart';
import 'package:seed_sales/screens/customers/components/customerlist.dart';
import 'package:seed_sales/screens/customers/components/provider/customer_provider.dart';
import 'package:seed_sales/screens/customers/models/customer_model.dart';
import 'package:seed_sales/sizeconfig.dart';

class CustomerList extends StatelessWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithSearch(context, customers),
      body: Consumer<CustomerProvider>(

        builder: (context, snapshot,child) {
          return GridView.builder(
            gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio:  3 / 1.5,
            ),
            itemCount: snapshot.customerList.length,
              itemBuilder: (_,index){
                return CustomerListTile(model: snapshot.customerList[index]);
              }
          );
        }
      ),
      bottomNavigationBar: const BottomAppBar(
        color: blackColor,
        child: SizedBox(
          width: double.infinity,
          height: 50,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: lightBlack,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=>const CustomerListForm()));
         // showAlertDelete1(context);
        },
        child: const Center(
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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

        decoration: BoxDecoration(
          color: blackColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(model.name,style: textStyle(SizeConfig.blockSizeHorizontal!*6, FontWeight.bold),),
            ),
            spacer(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(model.phone1.toString(),style: textStyle(SizeConfig.blockSizeHorizontal!*4, FontWeight.normal),),
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Pending amount :",style: textStyle(SizeConfig.blockSizeHorizontal!*4, FontWeight.normal),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${model.pendingAmt}",style:TextStyle(fontWeight: FontWeight.bold,fontSize: SizeConfig.blockSizeHorizontal!*4.5,color: Colors.redAccent),),
                    ),
                  ],
                ),
              ],
            ),
            spacer(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: lightBlack),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/icons/trash.svg',
                        width: 20,
                        height: 20,
                        color: whiteColor,
                      ),
                    )),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: lightBlack),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'assets/icons/edit.svg',
                      width: 20,
                      height: 20,
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
