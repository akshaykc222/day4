import 'package:flutter/material.dart';
import 'package:seed_sales/componets.dart';
import 'package:seed_sales/screens/dashbord/model/menu_model.dart';

class CategorySelection extends StatefulWidget {
  const CategorySelection({Key? key}) : super(key: key);

  @override
  State<CategorySelection> createState() => _CategorySelectionState();
}

class _CategorySelectionState extends State<CategorySelection> {
  String catDrop = "Cate1";
  List<MenuModel> menuData = [
    MenuModel(title: "Cate1", icon: Icons.maps_home_work),
    MenuModel(title: "Cate2", icon: Icons.maps_home_work),
  ];
  String subCat = "SubCate1";
  List<MenuModel> subMenu = [
    MenuModel(title: "SubCate1", icon: Icons.maps_home_work),
    MenuModel(title: "SubCate2", icon: Icons.maps_home_work),
  ];
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: visible,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Category',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        print("Dgdfg");
                        // showModalBottomSheet(
                        //     context: context,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(10.0),
                        //     ),
                        //     builder: (BuildContext context) {
                        //       return Padding(
                        //         padding: MediaQuery.of(context).viewInsets,
                        //         child: const AddCategory(),
                        //       );
                        //     });
                      },
                      child: const Icon(
                        Icons.add,
                        size: 25,
                      ))
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: DropdownButtonFormField(
                  // Initial Value
                  value: catDrop,
                  decoration: InputDecoration(
                      labelText: " Category",
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: menuData.map((e) {
                    return DropdownMenuItem(
                      value: e.title,
                      child: Text(e.title),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      catDrop = newValue!;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Sub Category',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        // print("Dgdfg");
                        // showModalBottomSheet(
                        //     context: context,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(10.0),
                        //     ),
                        //     builder: (BuildContext context) {
                        //       return Padding(
                        //         padding: MediaQuery.of(context).viewInsets,
                        //         child: const AddSubCategory(),
                        //       );
                        //     });
                      },
                      child: const Icon(
                        Icons.add,
                        size: 25,
                      ))
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: DropdownButtonFormField(
                  // Initial Value
                  value: subCat,
                  decoration: InputDecoration(
                      labelText: "Sub Category",
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: subMenu.map((e) {
                    return DropdownMenuItem(
                      value: e.title,
                      child: Text(e.title),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      catDrop = newValue!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        spacer(10),
        const Divider(),
        InkWell(
            onTap: () {
              setState(() {
                visible = !visible;
              });
            },
            child: visible
                ? const Icon(
                    Icons.keyboard_arrow_up,
                    size: 35,
                  )
                : const Icon(
                    Icons.keyboard_arrow_down,
                    size: 35,
                  ))
      ],
    );
  }
}
