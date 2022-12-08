import 'package:admin_fruit_market/add_category_ui/add_vegetable_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../const/const.dart';
import '../widget/text_size.dart';
import 'add_dry_fruit_screen.dart';
import 'add_fruit_screen.dart';

class AddHomeScreen extends StatefulWidget {
  const AddHomeScreen({Key? key}) : super(key: key);

  @override
  State<AddHomeScreen> createState() => _AddHomeScreenState();
}

class _AddHomeScreenState extends State<AddHomeScreen> {
  int select = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff69A03A),
        title: TextSize(
          text: "Select Categories",
          weight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        select = index;
                      });
                      print('fghj$select');
                      Get.to(
                        select == 0
                            ? AddVegetableScreen(
                                id1: "VegetablesDoc",
                                mainCategoryName: "Vagetables",
                              )
                            : select == 1
                                ? AddFruitScreen(
                                    id1: "FruitDoc",
                                    mainCategoryName: "Fruit",
                                  )
                                : AddDryFruitScreen(
                                    id1: "DryFruitDoc",
                                    mainCategoryName: "DryFruit",
                                  ),
                      );
                    },
                    child: Card(
                        child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.orange,
                            backgroundImage:
                                AssetImage(mainCategoryImages[index]),
                          ),
                          title: TextSize(
                            text: mainCategoryTitle[index],
                            weight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
