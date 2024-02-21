import 'dart:io';

import 'package:e_gift_store_admin/controller/categories/view_controller.dart';
import 'package:e_gift_store_admin/core/constant/routes.dart';
import 'package:e_gift_store_admin/data/datasource/remote/categories_data.dart';
import 'package:e_gift_store_admin/data/model/categoriesmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/functions/uploadimage.dart';

class CategoriesEditController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController namear;

  CategoriesModel? categoriesModel;

  StatusRequest statusRequest = StatusRequest.none;

  File? file;
  //Uses method in core/functions
  chooseImageFromGallery() async {
    file = await imageUploadGallery();
    update();
  }

  //Uses method in core/functions
  chooseImageFromCamera() async {
    file = await imageUploadCamera();
    update();
  }

  editData() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;

      update();

      Map data = {
        "name": name.text,
        "namear": namear.text,
        "imageold": categoriesModel!.categoriesImage!,
        "id": categoriesModel!.categoriesId!.toString()
      };
      var response = await categoriesData.edit(data, file);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.categoriesview);
          CategoriesViewController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        print(response);
      }
      update();
    } else {
      print("empty fields");
    }
  }

  @override
  void onInit() {
    categoriesModel = Get.arguments['categoriesModel'];
    name = TextEditingController();
    namear = TextEditingController();
    name.text = categoriesModel!.categoriesName!;
    namear.text = categoriesModel!.categoriesNameAr!;
    super.onInit();
  }
}
