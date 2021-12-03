import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seed_sales/screens/tax/components/add_tax.dart';

import '../../componets.dart';
import '../../constants.dart';

class Tax extends StatelessWidget {
  const Tax({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void showAlertDelete1(BuildContext _context) {
      showModalBottomSheet(
          context: _context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          builder: (_) {
            return Wrap(
              children: const [
                 TaxForm()

              ],
            );
          });
    }


    List<String> userList = ["tax1", "gst", "igst"];
    return Scaffold(
      extendBody: true,
      appBar: appBar("Tax", [], context),
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
              return TaxListTile(title: userList[index]);
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

class TaxListTile extends StatelessWidget {
  final String title;
  const TaxListTile({Key? key, required this.title}) : super(key: key);

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
                    color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
              ),
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
