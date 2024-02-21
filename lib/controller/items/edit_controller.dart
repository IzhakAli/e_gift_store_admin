import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:e_gift_store_admin/controller/items/view_controller.dart';
import 'package:e_gift_store_admin/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/functions/uploadimage.dart';
import '../../data/datasource/remote/categories_data.dart';
import '../../data/datasource/remote/items_data.dart';
import '../../data/model/categoriesmodel.dart';
import '../../data/model/itemsmodel.dart';

class ItemsEditController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  String? active;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  List<SelectedListItem> dropdownlist = [];

  late TextEditingController dropdownname;
  late TextEditingController dropdownid;

  late TextEditingController name;
  late TextEditingController namear;

  late TextEditingController desc;
  late TextEditingController descar;

  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;

  late TextEditingController catname;
  late TextEditingController catid;

  ItemsModel? itemsModel;

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

  changeStatusActive(String val) {
    active = val;
    update();
  }

  editData() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;

      update();

      Map data = {
        "id": itemsModel!.itemsId.toString(),
        "imageold": itemsModel!.itemsImage,
        "active": active,
        "name": name.text,
        "namear": namear.text,
        "desc": desc.text,
        "descar": descar.text,
        "count": count.text,
        "price": price.text,
        "discount": discount.text,
        "catid": catid!.text,
        "datenow": DateTime.now().toString()
      };
      var response = await itemsData.edit(data, file);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.itemsview);
          ItemsViewController c = Get.find();
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

  getCategories() async {
    CategoriesData categoriesData = CategoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    update();

    var response = await categoriesData.get();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<CategoriesModel> data = [];
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));

        for (int i = 0; i < data.length; i++) {
          dropdownlist.add(SelectedListItem(
              name: data[i].categoriesName!, value: data[i].categoriesId));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    itemsModel = Get.arguments['itemsModel'];
    getCategories();
    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    dropdownname = TextEditingController();
    dropdownid = TextEditingController();
    catname = TextEditingController();
    catid = TextEditingController();
    ///////
    name.text = itemsModel!.itemsName!;
    namear.text = itemsModel!.itemsNameAr!;
    desc.text = itemsModel!.itemsDesc!;
    descar.text = itemsModel!.itemsDescAr!;
    count.text = itemsModel!.itemsCount.toString()!;
    price.text = itemsModel!.itemsPrice.toString()!;
    discount.text = itemsModel!.itemsDiscount.toString()!;

    active = itemsModel!.itemsActive.toString();
    super.onInit();
  }
}
