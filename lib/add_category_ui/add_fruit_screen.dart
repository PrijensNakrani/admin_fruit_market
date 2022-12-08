import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../const/const.dart';
import '../widget/text_size.dart';
import 'add_detail_screen.dart';

class AddFruitScreen extends StatefulWidget {
  final id1;
  final mainCategoryName;
  const AddFruitScreen({Key? key, this.id1, this.mainCategoryName})
      : super(key: key);

  @override
  State<AddFruitScreen> createState() => _AddFruitScreenState();
}

class _AddFruitScreenState extends State<AddFruitScreen> {
  int select = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff69A03A),
        title: TextSize(
          text: "Fruit",
          weight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        select = index;
                      });
                      Get.to(
                        AddDetailScreen(
                          id2: select == 0
                              ? "OrganicFruitsDoc"
                              : select == 1
                                  ? 'MixedFruitsDoc'
                                  : select == 2
                                      ? "StoneFruitDoc"
                                      : 'MelonsDoc',
                          mainCategoryName: widget.mainCategoryName,
                          subCategoryName: select == 0
                              ? "OrganicFruits"
                              : select == 1
                                  ? 'MixedFruitPack'
                                  : select == 2
                                      ? "StoneFruits"
                                      : 'Melons',
                          id1: widget.id1,
                        ),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.orange,
                          backgroundImage:
                              AssetImage(fruitCategoryImages[index]),
                        ),
                        title: TextSize(
                          text: fruitCategoryTitle[index],
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
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
