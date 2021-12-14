import 'package:flutter/material.dart';
import 'package:seed_sales/constants.dart';
import 'package:seed_sales/sizeconfig.dart';

import '../../../componets.dart';

class RoleForm extends StatefulWidget {
  const RoleForm({Key? key}) : super(key: key);

  @override
  _RoleFormState createState() => _RoleFormState();
}

class _RoleFormState extends State<RoleForm> {
  final taxController=TextEditingController();
  final roleEdit=TextEditingController();
  final taxPercentageController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        headingText("Add Role"),
        spacer(10),
        columUserTextFiledsBlack("Enter Role name", "Role name", TextInputType.none, roleEdit),
        spacer(10),
        // columUserTextFiledsBlack("Enter tax short name", "Tax short name", TextInputType.none, taxPercentageController),
        // spacer(10),
        // columUserTextFiledsBlack("Enter tax percentage", "Tax percentage", TextInputType.number, taxPercentageController),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            defaultButton(SizeConfig.screenWidth!*0.5, add),

            InkWell(
                onTap: (){

                },
                child:const Text(cancel,style: TextStyle(color: blackColor),))
          ],
        ),
        spacer(10)
      ],
    );
  }
}
