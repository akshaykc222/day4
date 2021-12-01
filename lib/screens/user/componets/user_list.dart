import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seed_sales/componets.dart';
import 'package:seed_sales/constants.dart';
import 'package:seed_sales/screens/user/body.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> userList = ["akshay", "jomey", "rakesh"];
    return Scaffold(
      extendBody: true,
      appBar: appBar("Users", [], context),
      resizeToAvoidBottomInset: false,
      body: Expanded(
        child: Container(
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
                return UserListTile(title: userList[index]);
              }),
        ),
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
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const UserCreation()));
        },
        child: const Center(
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class UserListTile extends StatelessWidget {
  final String title;
  const UserListTile({Key? key, required this.title}) : super(key: key);

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
            Text(
              title,
              style: const TextStyle(
                  color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            spacer(5),
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
