import 'package:firebase/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seed_sales/screens/roles/models/role_model.dart';

class RoleProvider with ChangeNotifier{
  List<Roles> roleList=[];

  void addToFirebase(Roles model, BuildContext context) {
    print('adding');
    Database db = database();
    DatabaseReference ref = db.ref("Roles");

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
}