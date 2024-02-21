import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:e_gift_store_admin/controller/items/view_controller.dart';
import 'package:e_gift_store_admin/core/constant/routes.dart';
import 'package:e_gift_store_admin/data/model/categoriesmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/functions/uploadimage.dart';
import '../../data/datasource/remote/categories_data.dart';
import '../../data/datasource/remote/items_data.dart';

class ItemsAddController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

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

  addData() async {
    if (formstate.currentState!.validate()) {
      if (file == null)
        return Get.snackbar("Warning", "You must upload an image");

      statusRequest = StatusRequest.loading;

      update();

      Map data = {
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
      var response = await itemsData.add(data, file!);
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

    super.onInit();
  }

  // showDropDown(context) {
  //   DropDownState(
  //     DropDown(
  //       bottomSheetTitle: const Text(
  //         "Categories",
  //         style: TextStyle(
  //           fontWeight: FontWeight.bold,
  //           fontSize: 20.0,
  //         ),
  //       ),
  //       submitButtonChild: const Text(
  //         'Done',
  //         style: TextStyle(
  //           fontSize: 16,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //       data: [SelectedListItem(name: "Wathces")],
  //       selectedItems: (List<dynamic> selectedList) {
  //         SelectedListItem selectedListItem = selectedList[0];
  //         dropdownname.text = selectedListItem.name;
  //
  //         // showSnackBar(list.toString());
  //       },
  //     ),
  //   ).showModal(context);
  // }
}
