import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewacceptedOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  donePrepare(String ordersid, String userid, String orderstype) async {
    var response = await crud.postData(AppLink.prepare,
        {"ordersid": ordersid, "usersid": userid, "ordertype": orderstype});
    return response.fold((l) => l, (r) => r);
  }
}
