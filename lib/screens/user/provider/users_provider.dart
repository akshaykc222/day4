import 'package:firebase/firebase.dart';
import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seed_sales/screens/user/models/user_model.dart';

class UserProviderNew with ChangeNotifier {

  List<UserModel> businessList = [];

  void getBusinessList() {
    businessList.clear();
    notifyListeners();
    FirebaseDatabaseWeb.instance
        .reference()
        .child("Users")
        .onValue
        .listen((event) {
      Map<String, dynamic> d = event.value;
      d.values.forEach((element) {
        UserModel m = UserModel.fromJson(element);
        print(m);
        businessList.add(m);
        notifyListeners();
      });
    });
  }

  void addToFirebase(UserModel model, BuildContext context) {
    print('adding');
    Database db = database();
    DatabaseReference ref = db.ref("Usres");

    print(model.toJson());
    ref.child(model.id).set(model.toJson()).whenComplete(() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: const Text('Added'),
              content: const Text('User added successfully'),
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

  void deletBusines(UserModel model, BuildContext context) {
    Database db = database();
    DatabaseReference ref = db.ref("Users");
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
                  Navigator.pop(context);
                  getBusinessList();

                },
                child: const Text('delete'),
              ),
            ],
          );
        });
  }

}
