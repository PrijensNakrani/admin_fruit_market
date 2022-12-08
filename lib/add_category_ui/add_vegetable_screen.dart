import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../const/const.dart';
import '../widget/text_size.dart';
import 'add_detail_screen.dart';

class AddVegetableScreen extends StatefulWidget {
  final id1;
  final mainCategoryName;
  const AddVegetableScreen({Key? key, this.id1, this.mainCategoryName})
      : super(key: key);

  @override
  State<AddVegetableScreen> createState() => _AddVegetableScreenState();
}

class _AddVegetableScreenState extends State<AddVegetableScreen> {
  int select = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff69A03A),
        title: TextSize(
          text: "Vegetable",
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
                      print('>>>>>>>>>>>>>.$select');
                      print("============${widget.mainCategoryName}");
                      Get.to(
                        AddDetailScreen(
                          id2: select == 0
                              ? "OrganicVegetableDoc"
                              : select == 1
                                  ? 'MixedVegetableDoc'
                                  : select == 2
                                      ? "AlliumDoc"
                                      : 'RootDoc',
                          mainCategoryName: widget.mainCategoryName,
                          subCategoryName: select == 0
                              ? "OrganicVegetable"
                              : select == 1
                                  ? 'MixedVegetable'
                                  : select == 2
                                      ? "Allium"
                                      : 'Root',
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
                              AssetImage(vegetableCategoryImages[index]),
                        ),
                        title: TextSize(
                          text: vegetableCategoryTitle[index],
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
