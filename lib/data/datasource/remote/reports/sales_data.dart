import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

//used to get the data to generate a sales revenue report from generate reports category, sales report.
class SalesData {
  Crud crud;

  SalesData(this.crud);

  getData(String startDate, String endDate) async {
    var response = await crud.postData(
        AppLink.salesReport, {"startdate": startDate, "enddate": endDate});
    return response.fold((l) => l, (r) => r);
  }
}
