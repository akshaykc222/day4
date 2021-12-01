import 'package:flutter/material.dart';
import 'package:seed_sales/componets.dart';

import 'componets/create_business.dart';

class Bussiness extends StatelessWidget {
  const Bussiness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Bussiness", [], context),
      body: const SingleChildScrollView(
          scrollDirection: Axis.vertical, child: CreateBussiness()),
    );
  }
}
