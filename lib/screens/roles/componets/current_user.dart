import 'package:flutter/material.dart';

import '../../../constants.dart';

class CurrentUser extends StatelessWidget {
  const CurrentUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              currentuser,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
            ),
          ),
          Icon(Icons.login_outlined)
        ],
      ),
    );
  }
}
