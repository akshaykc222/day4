import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed_sales/screens/bussiness/models/bussinessmode.dart';
import 'package:seed_sales/screens/bussiness/provider/business_provider.dart';
import 'package:seed_sales/screens/roles/models/role_model.dart';
import 'package:seed_sales/screens/user/provider/bussiness_provider.dart';
import 'package:seed_sales/screens/user/provider/roles_provider.dart';

import '../../../componets.dart';
import '../../../constants.dart';
import '../../roles/provider/role_provider.dart';
import 'add_company.dart';

class UserCreationForm extends StatefulWidget {
  const UserCreationForm({Key? key}) : super(key: key);

  @override
  _UserCreationFormState createState() => _UserCreationFormState();
}

class _UserCreationFormState extends State<UserCreationForm> {
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<RoleProviderNew>(context,listen: false).getFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          columUserTextFileds("Enter name of the user", "Name",
              TextInputType.name, nameController),
          spacer(10),
          columUserTextFileds("Enter E-mail of the user", "E-mail",
              TextInputType.emailAddress, mailController),
          spacer(10),
          columUserTextFileds("Enter phone number of the user", "Phone",
              TextInputType.phone, phoneController),
          spacer(10),
          // columUserTextFileds("Enter Designation of the user", "Designation",
          //     TextInputType.emailAddress),
          columUserTextFileds("Enter Password", "Password",
              TextInputType.visiblePassword, passwordController),
          spacer(10),
          columUserTextFileds("Confirm Password", "Confirm Password",
              TextInputType.visiblePassword, confirmPassController),
          spacer(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Text(
                  'Access company',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                ),
              ),
              InkWell(
                  onTap: () {
                    print("Dgdfg");
                    showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        builder: (BuildContext context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: const SelectBussines(),
                          );
                        });
                  },
                  child: const Icon(
                    Icons.add,
                    size: 25,
                    color: textColor,
                  ))
            ],
          ),
          spacer(10),
          const AddCompany(),
        ],
      ),
    );
  }
}

// Widget designationDropDown() {}

class SelectBussines extends StatefulWidget {
  const SelectBussines({Key? key}) : super(key: key);

  @override
  State<SelectBussines> createState() => _SelectBussinesState();
}

class _SelectBussinesState extends State<SelectBussines> {
  String selectedBussines = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Add Company access",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Consumer<BusinessProvider>(builder: (context, provider, child) {
            return DropdownButtonFormField(
              value: provider.selectedBusiness,
              icon: const Icon(Icons.keyboard_arrow_down),
              decoration: InputDecoration(
                  labelText: "Bussiness",
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              items: provider.businessList
                  .map((e) => DropdownMenuItem<BusinessModel>(value: e, child: Text(e.name)))
                  .toList(),
              onChanged: (BusinessModel? value) {
                setState(() {
                  provider.setDropDownValue(value!);
                });
              },
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<RoleProviderNew>(builder: (context, provider, child) {
            return DropdownButtonFormField(
              value: provider.selectedDropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              decoration: const InputDecoration(
                  labelText: "Type",
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
              items: provider.roleList
                  .map((e) => DropdownMenuItem<Roles>(value: e, child: Text(e.roleName)))
                  .toList(),
              onChanged: (Roles? value) {
                setState(() {
                  provider.setSelectedList(value!);
                });
              },
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              onTap: () {
                Provider.of<BusinessProvider>(context, listen: false)
                    .setSelectedBussiness();
                Navigator.pop(context);
              },
              child:
                  defaultButton(MediaQuery.of(context).size.width * 0.4, add)),
        )
      ],
    );
  }
}
