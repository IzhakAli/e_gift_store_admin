import 'package:e_gift_store_admin/data/datasource/remote/categories_data.dart';
import 'package:e_gift_store_admin/data/model/categoriesmodel.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';

class CategoriesViewController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  List<CategoriesModel> data = [];

  StatusRequest statusRequest = StatusRequest.none;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await categoriesData.get();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteCategory(String id, String imagename) {
    categoriesData.delete({"id": id, "imagename": imagename});
    data.removeWhere(
        (element) => element.categoriesId.toString() == id.toString());
    update();
  }

  goToPageEdit(CategoriesModel categoriesModel) {
    Get.toNamed(AppRoute.categoriesedit,
        arguments: {"categoriesModel": categoriesModel});
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  myback() {
    Get.offAllNamed(AppRoute.homePage);
    return Future.value(false);
  }
}
