import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class CustomerFeedbackData {
  Crud crud;

  CustomerFeedbackData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.customerFeedback, {});
    return response.fold((l) => l, (r) => r);
  }
}
