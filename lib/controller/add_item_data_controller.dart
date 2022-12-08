import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddItemDataController extends GetxController {
  RxBool isAddLoading = false.obs;
  RxBool isUpdateLoading = false.obs;
  final picker = ImagePicker();
  File? image;
//
  Future getCameraImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
      print("=========${image}");
    }
  }

  Future getGalleryImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
      print("=========>>>${image}");
    }
  }

  Future<String?> uploadFile({File? file, String? filename}) async {
    print("File path:$file");
    try {
      var response = await FirebaseStorage.instance
          .ref("user_image/$filename")
          .putFile(file!);
      var result =
          await response.storage.ref("user_image/$filename").getDownloadURL();
      return result;
    } catch (e) {
      print("ERROR===>>$e");
    }
    return null;
  }

  Future addItemData(
    mainCategoryName,
    id1,
    subCategoryName,
    nameController,
    descriptionController,
    nutrition1Controller,
    nutrition2Controller,
    nutrition3Controller,
    nutrition4Controller,
    nutrition5Controller,
    priceController,
  ) async {
    isAddLoading.value = true;

    try {
      var id2 = Random().nextInt(1000000);
      print("===============${id2}");
      isAddLoading.value = true;
      String? itemImage = await uploadFile(file: image, filename: "${id2}");
      update();
      FirebaseFirestore.instance
          .collection(mainCategoryName)
          .doc(id1)
          .collection(subCategoryName)
          .add({
        "name": nameController.text,
        "description": descriptionController.text,
        "nutrition1": nutrition1Controller.text,
        "nutrition2": nutrition2Controller.text,
        "nutrition3": nutrition3Controller.text,
        "nutrition4": nutrition4Controller.text,
        "nutrition5": nutrition5Controller.text,
        "price": priceController.text,
        "itemImage": itemImage,
        "subCategoryName": mainCategoryName,
        "Favourite": false,
        "Cart": false,
      }).then((value) => isAddLoading.value = false);
    } catch (e) {
      isAddLoading.value = false;
      print(e);
    }
  }

  Future updateItemData(
      mainCategoryName,
      id1,
      subCategoryName,
      itemId,
      nameController,
      descriptionController,
      nutrition1Controller,
      nutrition2Controller,
      nutrition3Controller,
      nutrition4Controller,
      nutrition5Controller,
      priceController,
      itemImage2) async {
    try {
      var id2 = Random().nextInt(1000000);
      print("===============${id2}");
      print("888888888$itemId");

      String? itemImage = await uploadFile(file: image, filename: "${id2}");
      update();

      FirebaseFirestore.instance
          .collection(mainCategoryName)
          .doc(id1)
          .collection(subCategoryName)
          .doc(itemId)
          .update({
        "name": nameController,
        "description": descriptionController,
        "nutrition1": nutrition1Controller,
        "nutrition2": nutrition2Controller,
        "nutrition3": nutrition3Controller,
        "nutrition4": nutrition4Controller,
        "nutrition5": nutrition5Controller,
        "price": priceController,
        "itemImage": itemImage ?? itemImage2,
        "itemId": itemId,
      });

      // FirebaseFirestore.instance
      //     .collection("Cart")
      //     .doc(FirebaseAuth.instance.currentUser!.uid)
      //     .collection("Cart1")
      //     .doc(itemId)
      //     .update({
      //   "image": itemImage,
      //   "title": nameController.toString(),
      //   "description": descriptionController.toString(),
      //   "nutrition1": nutrition1Controller.toString(),
      //   "nutrition2": nutrition2Controller.toString(),
      //   "nutrition3": nutrition3Controller.toString(),
      //   "nutrition4": nutrition4Controller.toString(),
      //   "nutrition5": nutrition5Controller.toString(),
      //   "price": priceController.toString(),
      //   "counter": 1,
      // });

      List x = [];

      var usersId = FirebaseFirestore.instance.collection('user');

      var nnj = await usersId.get();
      x = [];
      for (var element in nnj.docs) {
        x.add(element.id);
        print('srdfghjkl$x');
      }

      for (int i = 0; i < x.length; i++) {
        FirebaseFirestore.instance
            .collection("Favourite")
            .doc(x[i])
            .collection("Favourite1")
            .doc(itemId)
            .update({
          "image": itemImage,
          "title": nameController,
          "description": descriptionController,
          "nutrition1": nutrition1Controller,
          "nutrition2": nutrition2Controller,
          "nutrition3": nutrition3Controller,
          "nutrition4": nutrition4Controller,
          "nutrition5": nutrition5Controller,
          "price": priceController,
          "counter": 1,
          "totalItemPrice": priceController,
          "totalCartPrice": 0,
        });
        FirebaseFirestore.instance
            .collection("Cart")
            .doc(x[i])
            .collection("Cart1")
            .doc(itemId)
            .update({
          "image": itemImage,
          "title": nameController,
          "description": descriptionController,
          "nutrition1": nutrition1Controller,
          "nutrition2": nutrition2Controller,
          "nutrition3": nutrition3Controller,
          "nutrition4": nutrition4Controller,
          "nutrition5": nutrition5Controller,
          "price": priceController,
          "counter": 1,
          "totalItemPrice": priceController,
          "totalCartPrice": 0,
        });
      }
    } catch (e) {
      isUpdateLoading.value = false;
      print(e);
    }
  }

  Future setAddToCart(
    itemId,
  ) async {}
}
