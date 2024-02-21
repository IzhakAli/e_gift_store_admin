import 'package:e_gift_store_admin/core/class/statusrequest.dart';
import 'package:e_gift_store_admin/data/datasource/remote/reports/customerfeedback_data.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdatacontroller.dart';

class CustomerFeedbackController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  CustomerFeedbackData customerFeedbackData = CustomerFeedbackData(Get.find());

  List<dynamic> data = [];
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await customerFeedbackData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data = response['data'];
      } else {
        statusRequest = StatusRequest.failure;
        Get.snackbar("Error", "Couldn't fetch data, try again later");
      }
    }
    update();
  }
}
