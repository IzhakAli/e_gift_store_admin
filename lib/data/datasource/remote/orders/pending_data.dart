import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewpendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  approveOrder(String userid, String ordersid) async {
    var response = await crud.postData(
        AppLink.approveOrders, {"usersid": userid, "ordersid": ordersid});
    return response.fold((l) => l, (r) => r);
  }
}
