import 'package:e_gift_store_admin/core/class/statusrequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/datasource/notifications_data.dart';

class NotificationsController extends GetxController {
  NotificationsGeneratorData notificationData =
      NotificationsGeneratorData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController notification_title;
  late TextEditingController notification_message;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  void sendNotification() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await notificationData.send_notification(
          notification_title!.text, notification_message!.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        Get.offAllNamed(AppRoute.homePage);
        Get.snackbar("Success", "Your Notification was send successfully");
      } else {
        Get.snackbar("Error", "Something went wrong, try again later");
      }
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    notification_title = TextEditingController(); // Initialize the controller
    notification_message = TextEditingController(); // Initialize the controller
  }

  @override
  void onClose() {
    // Dispose the controllers when the controller is removed from memory.
    notification_title.dispose();
    notification_message.dispose();
    super.onClose();
  }
}
