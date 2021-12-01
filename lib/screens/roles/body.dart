import 'package:flutter/material.dart';
import 'package:seed_sales/componets.dart';

import '../../constants.dart';
import 'componets/current_user.dart';
import 'componets/role_filelds.dart';

class UserRoles extends StatelessWidget {
  const UserRoles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("User Roles", [], context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: lightBlack,
          child: Column(
            children: const [RoleFields()],
          ),
        ),
      ),
      // floatingActionButton: Container(
      //   width: 100,
      //   height: 50,
      //   decoration: BoxDecoration(
      //       color: primaryColor, borderRadius: BorderRadius.circular(20.0)),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: const [
      //       Icon(
      //         Icons.save,
      //         color: Colors.white,
      //       ),
      //       Text(
      //         save,
      //         style:
      //             TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      //       )
      //     ],
      //   ),
      // ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: lightBlack,
        onPressed: () {
          Navigator.pushNamed(context, roleList);
        },
        child: Center(
          child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, roleList);
              },
              child: const Icon(Icons.add)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
