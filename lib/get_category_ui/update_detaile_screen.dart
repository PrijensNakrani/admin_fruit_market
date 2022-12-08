import 'dart:io';

import 'package:admin_fruit_market/controller/add_item_data_controller.dart';
import 'package:admin_fruit_market/widget/comom_text_field.dart';
import 'package:admin_fruit_market/widget/next_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widget/text_size.dart';

class UpdateDetailScreen extends StatelessWidget {
  final id1;
  final mainCategoryName;
  final subCategoryName;
  final itemId;
  final image;
  final name;
  final description;
  final nutrition1;
  final nutrition2;
  final nutrition3;
  final nutrition4;
  final nutrition5;
  final price;
  const UpdateDetailScreen(
      {Key? key,
      this.id1,
      this.mainCategoryName,
      this.subCategoryName,
      this.image,
      this.name,
      this.description,
      this.nutrition1,
      this.nutrition2,
      this.nutrition3,
      this.nutrition4,
      this.nutrition5,
      this.price,
      this.itemId})
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
    _nameController.text = name;
    _descriptionController.text = description;
    _nutrition1Controller.text = nutrition1;
    _nutrition2Controller.text = nutrition2;
    _nutrition3Controller.text = nutrition3;
    _nutrition4Controller.text = nutrition4;
    _nutrition5Controller.text = nutrition5;
    _priceController.text = price;
    File? _image;

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
                      onTap: () {},
                      child: Hero(
                        tag: image,
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.w),
                              width: double.infinity,
                              height: 176.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    image ??
                                        "https://cdn.icon-icons.com/icons2/564/PNG/512/Add_Image_icon-icons.com_54218.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
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
                            Positioned(
                              bottom: 10.h,
                              right: 20.w,
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SimpleDialog(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            child: GestureDetector(
                                              onTap: () {
                                                addUserDataController
                                                    .getGalleryImage();
                                                Navigator.pop(context);
                                              },
                                              child: NextContainer(
                                                  text: "Gallery"),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            child: GestureDetector(
                                                onTap: () {
                                                  addUserDataController
                                                      .getCameraImage();
                                                  Navigator.pop(context);
                                                },
                                                child: NextContainer(
                                                    text: "Camera")),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: CircleAvatar(
                                  backgroundColor: Color(0xff69A03A),
                                  radius: 24.r,
                                  child: Center(
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
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
                        controller.isUpdateLoading.value == false
                            ? GestureDetector(
                                onTap: () async {
                                  controller.isUpdateLoading.value = true;
                                  print("-------$id1");

                                  print(">>>>>>>>>>$mainCategoryName");
                                  print(">>>>>>>>>>$subCategoryName");

                                  if (_formKey.currentState!.validate()) {
                                    controller.isUpdateLoading.value = true;
                                    addUserDataController
                                        .updateItemData(
                                            mainCategoryName,
                                            id1,
                                            subCategoryName,
                                            itemId,
                                            _nameController.text,
                                            _descriptionController.text,
                                            _nutrition1Controller.text,
                                            _nutrition2Controller.text,
                                            _nutrition3Controller.text,
                                            _nutrition4Controller.text,
                                            _nutrition5Controller.text,
                                            _priceController.text,
                                            image)
                                        .then((value) => controller
                                            .isUpdateLoading.value = false);
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
                                      text: "Update",
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
