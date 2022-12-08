import 'package:admin_fruit_market/controller/add_item_data_controller.dart';
import 'package:admin_fruit_market/widget/comom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widget/next_container.dart';
import '../widget/text_size.dart';

class AddDetailScreen extends StatelessWidget {
  final id1;
  final id2;
  final mainCategoryName;
  final subCategoryName;
  final image;
  final name;
  final description;
  final nutrition1;
  final nutrition2;
  final nutrition3;
  final nutrition4;
  final nutrition5;
  final price;
  const AddDetailScreen(
      {Key? key,
      this.id1,
      this.mainCategoryName,
      this.subCategoryName,
      this.id2,
      this.image,
      this.name,
      this.description,
      this.nutrition1,
      this.nutrition2,
      this.nutrition3,
      this.nutrition4,
      this.nutrition5,
      this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController();
    final _descriptionController = TextEditingController();
    final _nutrition1Controller = TextEditingController();
    final _nutrition2Controller = TextEditingController();
    final _nutrition3Controller = TextEditingController();
    final _nutrition4Controller = TextEditingController();
    final _nutrition5Controller = TextEditingController();
    final _priceController = TextEditingController();
    AddItemDataController addUserDataController =
        Get.put(AddItemDataController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff69A03A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: const TextSize(
          text: "Detail",
          weight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: GetBuilder<AddItemDataController>(
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      addUserDataController.getGalleryImage();
                                      Navigator.pop(context);
                                    },
                                    child: NextContainer(text: "Gallery"),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: GestureDetector(
                                      onTap: () {
                                        addUserDataController.getCameraImage();
                                        Navigator.pop(context);
                                      },
                                      child: NextContainer(text: "Camera")),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        width: double.infinity,
                        height: 176.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://cdn.icon-icons.com/icons2/564/PNG/512/Add_Image_icon-icons.com_54218.png",
                            ),
                            fit: BoxFit.contain,
                          ),
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, blurRadius: 5)
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: controller.image != null
                              ? Image.file(
                                  controller.image!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              : Text(''),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    CommonTextField(
                        controller: _nameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter Title";
                          }
                        },
                        keyboardType: TextInputType.name,
                        hintText: "Name",
                        labelText: "Name",
                        action: TextInputAction.next,
                        obscureText: false),
                    SizedBox(
                      height: 8.h,
                    ),
                    CommonTextField(
                        controller: _descriptionController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter Description";
                          }
                        },
                        keyboardType: TextInputType.name,
                        hintText: "Description",
                        labelText: "Description",
                        action: TextInputAction.next,
                        obscureText: false),
                    SizedBox(
                      height: 25.h,
                    ),
                    TextSize(
                      text: "Nutrition",
                      weight: FontWeight.bold,
                      size: 18.sp,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CommonTextField(
                        controller: _nutrition1Controller,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter Nutrition";
                          }
                        },
                        keyboardType: TextInputType.name,
                        hintText: "1.Nutrition",
                        labelText: "1.Nutrition",
                        action: TextInputAction.next,
                        obscureText: false),
                    SizedBox(
                      height: 8.h,
                    ),
                    CommonTextField(
                        controller: _nutrition2Controller,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter Nutrition";
                          }
                        },
                        keyboardType: TextInputType.name,
                        hintText: "2.Nutrition",
                        labelText: "2.Nutrition",
                        action: TextInputAction.next,
                        obscureText: false),
                    SizedBox(
                      height: 8.h,
                    ),
                    CommonTextField(
                        controller: _nutrition3Controller,
                        // validator: (value) {
                        //   if (value.isEmpty) {
                        //     return "Enter Nutrition";
                        //   }
                        // },
                        keyboardType: TextInputType.name,
                        hintText: "3.Nutrition",
                        labelText: "3.Nutrition",
                        action: TextInputAction.next,
                        obscureText: false),
                    SizedBox(
                      height: 8.h,
                    ),
                    CommonTextField(
                        controller: _nutrition4Controller,
                        // validator: (value) {
                        //   if (value.isEmpty) {
                        //     return "Enter Nutrition";
                        //   }
                        // },
                        keyboardType: TextInputType.name,
                        hintText: "4.Nutrition",
                        labelText: "4.Nutrition",
                        action: TextInputAction.next,
                        obscureText: false),
                    SizedBox(
                      height: 8.h,
                    ),
                    CommonTextField(
                        controller: _nutrition5Controller,
                        // validator: (value) {
                        //   if (value.isEmpty) {
                        //     return "Enter Nutrition";
                        //   }
                        // },
                        keyboardType: TextInputType.name,
                        hintText: "5.Nutrition",
                        labelText: "5.Nutrition",
                        action: TextInputAction.next,
                        obscureText: false),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 60.h,
                          width: 160.w,
                          child: CommonTextField(
                              controller: _priceController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Enter Price";
                                }
                              },
                              keyboardType: TextInputType.number,
                              hintText: "Price / Kg",
                              labelText: "Price / Kg",
                              action: TextInputAction.done,
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10.w),
                              obscureText: false),
                        ),
                        controller.isAddLoading == false
                            ? GestureDetector(
                                onTap: () {
                                  print("-------${id1}");
                                  print(">>>>>>>>>>${id2}");
                                  print(">>>>>>>>>>${mainCategoryName}");
                                  print(">>>>>>>>>>${subCategoryName}");

                                  if (_formKey.currentState!.validate()) {
                                    if (controller.image == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Please Select a Image')));
                                    } else {
                                      addUserDataController.addItemData(
                                        mainCategoryName,
                                        id1,
                                        subCategoryName,
                                        _nameController,
                                        _descriptionController,
                                        _nutrition1Controller,
                                        _nutrition2Controller,
                                        _nutrition3Controller,
                                        _nutrition4Controller,
                                        _nutrition5Controller,
                                        _priceController,
                                      );
                                    }
                                  }
                                },
                                child: Container(
                                  height: 40.h,
                                  width: 148.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: Color(0xff69A03A),
                                  ),
                                  child: const Center(
                                    child: TextSize(
                                      text: "Add",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              )
                      ],
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
