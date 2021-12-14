import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed_sales/constants.dart';
import 'package:seed_sales/router.dart';
import 'package:seed_sales/screens/Desingation/provider/desingation_provider.dart';
import 'package:seed_sales/screens/dashbord/provider/dashboard_provider.dart';
import 'package:seed_sales/screens/login/provider/login_provider.dart';
import 'package:seed_sales/screens/roles/provider/role_provider.dart';
import 'package:seed_sales/screens/user/provider/users_provider.dart';

import 'screens/bussiness/provider/business_provider.dart';
import 'screens/user/provider/bussiness_provider.dart';
import 'screens/user/provider/roles_provider.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firebase.dart' as firebase;

void main() {
  if (firebase.apps.isEmpty) {
    initializeApp(
        apiKey: "AIzaSyAxOsMzAEyHkh1WvccFG4HkD3QpP9R4SWQ",
        authDomain: "fresh-1b966.firebaseapp.com",
        databaseURL:
            "https://fresh-1b966-default-rtdb.asia-southeast1.firebasedatabase.app",
        projectId: "fresh-1b966",
        storageBucket: "fresh-1b966.appspot.com",
        messagingSenderId: "770682582470",
        appId: "1:770682582470:web:514a41533ccf8aaf2f6ec7",
        measurementId: "G-B8C8ESHQ7B");
  }
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
        ChangeNotifierProvider(create: (_) => RoleProviderNew()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => BusinessProvider()),
        ChangeNotifierProvider(create: (_)=>UserProviderNew())

      ],
      child: MaterialApp(
        color: blackColor,
        title: 'Fresh',
        theme: ThemeData(
            primaryColor: blackColor, scaffoldBackgroundColor: lightBlack),
        onGenerateRoute: RouterPage.generateRoute,
        initialRoute: loginNav,
      ),
    );
  }
}
