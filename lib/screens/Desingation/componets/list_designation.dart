import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:seed_sales/componets.dart';
import 'package:seed_sales/constants.dart';
import 'package:seed_sales/screens/Desingation/models/designation_model.dart';
import 'package:seed_sales/screens/Desingation/provider/desingation_provider.dart';

class ListDesingations extends StatefulWidget {
  const ListDesingations({Key? key}) : super(key: key);

  @override
  _ListDesingationsState createState() => _ListDesingationsState();
}

class _ListDesingationsState extends State<ListDesingations> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DesignationProvider>(builder: (context, snapshot, child) {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: snapshot.designationList.length,
          itemBuilder: (_, index) {
            return snapshot.designationList.isEmpty
                ? Container()
                : DesignationTile(model: snapshot.designationList[index]);
          });
    });
  }
}

class DesignationTile extends StatefulWidget {
  final DesingationModel model;
  const DesignationTile({Key? key, required this.model}) : super(key: key);

  @override
  State<DesignationTile> createState() => _DesignationTileState();
}

class _DesignationTileState extends State<DesignationTile> {
  void showAlertDelete(DesingationModel model) {
    showBottomSheet(
        context: context,
        builder: (_) {
          return Wrap(
            children: [
              Column(
                children: [
                  Text(
                    "This action will delete the ${model.designation} from the designations",
                    style: const TextStyle(
                        color: blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  spacer(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: () {
                            Provider.of<DesignationProvider>(context,
                                    listen: false)
                                .deleteDesingation(model);
                          },
                          child: defaultButton(
                              MediaQuery.of(context).size.width * 0.4,
                              "Delete")),
                      const Text(
                        cancel,
                        style: TextStyle(color: blackColor),
                      )
                    ],
                  )
                ],
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.model.designation,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              showAlertDelete(widget.model);
            },
            child: SvgPicture.asset(
              "assets/icons/trash.svg",
              color: textColor,
              width: 20,
              height: 20,
            ),
          ),
          SvgPicture.asset(
            "assets/icons/edit.svg",
            color: textColor,
            width: 20,
            height: 20,
          ),
        ],
      ),
    );
  }
}
