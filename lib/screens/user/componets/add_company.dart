import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed_sales/screens/user/provider/bussiness_provider.dart';

class AddCompany extends StatefulWidget {
  const AddCompany({Key? key}) : super(key: key);

  @override
  _AddCompanyState createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Consumer<BussinessProvider>(builder: (context, snapshot, child) {
        return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.listSelectedBusiness().length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, crossAxisSpacing: 5, mainAxisSpacing: 5),
            itemBuilder: (_, index) {
              return AddBussinesChip(
                  bussiness: snapshot.listSelectedBusiness()[index]);
            });
      }),
    );
  }
}

class AddBussinesChip extends StatelessWidget {
  final String bussiness;
  const AddBussinesChip({Key? key, required this.bussiness}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      elevation: 10,
      padding: const EdgeInsets.all(8),
      backgroundColor: Colors.greenAccent[100],
      shadowColor: Colors.black,
      avatar: const Icon(
        Icons.arrow_right_outlined,
        color: Colors.green,
      ), //CircleAvatar
      label: Text(
        bussiness,
        overflow: TextOverflow.clip,
        style: const TextStyle(fontSize: 14),
      ), //Text
    );
  }
}
