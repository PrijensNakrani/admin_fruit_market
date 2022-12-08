import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../const/const.dart';
import '../widget/text_size.dart';
import 'add_detail_screen.dart';

class AddDryFruitScreen extends StatefulWidget {
  final id1;
  final mainCategoryName;
  const AddDryFruitScreen({Key? key, this.id1, this.mainCategoryName})
      : super(key: key);

  @override
  State<AddDryFruitScreen> createState() => _AddDryFruitScreenState();
}

class _AddDryFruitScreenState extends State<AddDryFruitScreen> {
  int select = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff69A03A),
        title: TextSize(
          text: "Dry Fruit",
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
                              ? "IndehiscentDryFruitsDoc"
                              : select == 1
                                  ? 'MixedDryFruitsPackDoc'
                                  : select == 2
                                      ? "DehiscentDryFruitsDoc"
                                      : 'KashmiriDryFruitsDoc',
                          mainCategoryName: widget.mainCategoryName,
                          subCategoryName: select == 0
                              ? "IndehiscentDryFruits"
                              : select == 1
                                  ? 'MixedDryFruitsPack'
                                  : select == 2
                                      ? "DehiscentDryFruits"
                                      : 'KashmiriDryFruits',
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
                              AssetImage(dryFruitCategoryImages[index]),
                        ),
                        title: TextSize(
                          text: dryFruitCategoryTitle[index],
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
