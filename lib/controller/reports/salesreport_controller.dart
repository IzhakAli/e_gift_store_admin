import 'package:e_gift_store_admin/core/class/statusrequest.dart';
import 'package:e_gift_store_admin/data/model/salesrevenuemodel.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/reports/sales_data.dart';

class SalesReportController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  SalesData salesData = SalesData(Get.find());

  List<SalesRevenueModel> data = [];
  DateTime startDate = DateTime.now().subtract(const Duration(days: 7));
  DateTime endDate = DateTime.now();

  @override
  void onInit() {
    super.onInit();
  }

  void fetchSalesData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await salesData.getData(startDate.toString(), endDate.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => SalesRevenueModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  void updateStartDate(DateTime date) {
    startDate = date;
    update();
  }

  void updateEndDate(DateTime date) {
    endDate = date;
    update();
  }
}

// class SalesData {
//   String orderTitle;
//   double orderValue;
//
//   SalesData(this.orderTitle, this.orderValue);
// }
