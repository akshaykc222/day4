import 'package:firebase/firebase.dart';
import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/bussinessmode.dart';

class BusinessProvider with ChangeNotifier {
  bool loading = false;
  List<BusinessModel> businessList = [];

  void getBusinessList() {
    businessList.clear();
    FirebaseDatabaseWeb.instance
        .reference()
        .child("business")
        .onValue
        .listen((event) {
      Map<String, dynamic> d = event.value;
      d.values.forEach((element) {
        BusinessModel m = BusinessModel.fromJson(element);
        print(m);
        businessList.add(m);
        notifyListeners();
      });
    });
  }

  void addToFirebase(BusinessModel model, BuildContext context) {
    print('adding');
    Database db = database();
    DatabaseReference ref = db.ref("business");

    print(model.toJson());
    ref.child(model.id).set(model.toJson()).whenComplete(() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: const Text('Added'),
              content: const Text('Business added successfully'),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok'),
                ),
              ],
            );
          });
    }).onError((error, stackTrace) => ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(error.toString()))));
  }

  void deletBusines(BusinessModel model, BuildContext context) {
    Database db = database();
    DatabaseReference ref = db.ref("business");
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('Delete'),
            content: const Text('This will delete this business'),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () {
                  ref.child(model.id).remove();
                  getBusinessList();
                  Navigator.pop(context);
                },
                child: const Text('delete'),
              ),
            ],
          );
        });
  }
}
