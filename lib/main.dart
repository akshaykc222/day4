import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed_sales/constants.dart';
import 'package:seed_sales/router.dart';
import 'package:seed_sales/screens/Desingation/provider/desingation_provider.dart';
import 'package:seed_sales/screens/dashbord/provider/dashboard_provider.dart';

import 'screens/user/provider/bussiness_provider.dart';
import 'screens/user/provider/roles_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashBoardProvider()),
        ChangeNotifierProvider(create: (_) => DesignationProvider()),
        ChangeNotifierProvider(create: (_) => BussinessProvider()),
        ChangeNotifierProvider(create: (_) => RoleProvider())
      ],
      child: MaterialApp(
        color: blackColor,
        title: 'Fresh',
        theme: ThemeData(
            primaryColor: blackColor, scaffoldBackgroundColor: lightBlack),
        onGenerateRoute: RouterPage.generateRoute,
        initialRoute: adminPanel,
      ),
    );
  }
}
