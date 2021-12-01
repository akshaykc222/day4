import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:seed_sales/componets.dart';
import 'package:seed_sales/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seed_sales/screens/dashbord/componets/dashboard_items.dart';
import 'package:seed_sales/screens/dashbord/componets/menus.dart';
import 'package:seed_sales/screens/dashbord/provider/dashboard_provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
    with SingleTickerProviderStateMixin {
  final key1 = UniqueKey();
  final key2 = UniqueKey();
  void _onTap() {
    if (_flag) {
      _controller!.forward();
    } else {
      _controller!.reverse();
    }
    Provider.of<DashBoardProvider>(context, listen: false).setPopupOpen();
    _flag = !_flag;
  }

  bool _flag = true;

  Animation<double>? _myAnimation;
  AnimationController? _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _myAnimation = CurvedAnimation(curve: Curves.linear, parent: _controller!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Fresh",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: primaryColor,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Stack(children: [
        Column(
          children: const [DashBoardItems()],
        ),
        Consumer<DashBoardProvider>(builder: (context, provider, child) {
          return Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedSwitcher(
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                duration: const Duration(milliseconds: 300),
                reverseDuration: const Duration(milliseconds: 300),
                child: Container(
                  width: double.infinity,
                  color: whiteColor,
                  child: provider.isOpen
                      ? const AdminMenu()
                      : Container(
                          key: key2,
                        ),
                ),
              ));
        })
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: blackColor,
        onPressed: () {
          _onTap();
        },
        child: Center(
            child: AnimatedIcon(
                icon: AnimatedIcons.menu_close, progress: _myAnimation!)),
      ),
      bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedRectangle(),
          color: black90,
          child: SizedBox(
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: whiteColor,
                      ),
                      onPressed: () {}),
                ),

                const SizedBox(width: 40), // The dummy child

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: IconButton(
                      icon: const Icon(
                        Icons.person,
                        color: whiteColor,
                      ),
                      onPressed: () {}),
                ),
              ],
            ),
          )),
    );
  }
}
