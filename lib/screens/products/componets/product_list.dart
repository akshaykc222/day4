import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seed_sales/screens/products/body.dart';
import 'package:seed_sales/screens/tax/components/add_tax.dart';

import '../../../componets.dart';
import '../../../constants.dart';



class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void showAlertDelete1(BuildContext _context) {
      showModalBottomSheet(
          context: _context,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          builder: (_) {
            return Container(
                height: MediaQuery.of(context).size.height*0.8,
                child: const AddTreatments());
          });
    }


    List<String> userList = ["product1", "product2", "product3"];
    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 80),
        child: Container(
          color: blackColor,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: lightBlack, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 50,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            hintText: "search",
                            labelText: "Search",
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            fillColor: lightBlack,
                            filled: true),
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        color: lightBlack,
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: userList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio:
                MediaQuery.of(context).size.width * 0.3 / 90),
            itemBuilder: (_, index) {
              return ProductListTile(title: userList[index]);
            }),
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
          showAlertDelete1(context);
        },
        child: const Center(
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ProductListTile extends StatelessWidget {
  final String title;
  const ProductListTile({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: blackColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                    color: textColor, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            spacer(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const [
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text("\$1500",style: TextStyle(color: textColor,fontWeight: FontWeight.bold,fontSize: 19),),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text("\$1600",style: TextStyle(color: textColor,fontWeight: FontWeight.bold,fontSize: 17,decoration: TextDecoration.lineThrough,decorationColor: textColor,decorationStyle: TextDecorationStyle.solid),),
                )
              ],
            ),
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
