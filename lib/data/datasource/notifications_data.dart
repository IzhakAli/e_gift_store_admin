import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class NotificationsGeneratorData {
  Crud crud;

  NotificationsGeneratorData(this.crud);

  send_notification(String title, String message) async {
    var response = await crud.postData(
        AppLink.send_notification, {"title": title, "message": message});
    return response.fold((l) => l, (r) => r);
  }
}
