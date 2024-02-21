import 'package:e_gift_store_admin/core/class/handlingdataview.dart';
import 'package:e_gift_store_admin/view/widget/auth/custom_login_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/notifications_controller.dart';
import '../../core/functions/validinput.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Notifications"),
        ),
        body: GetBuilder<NotificationsController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: controller.formState,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Create Notification for Users',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.title),
                      ),
                      keyboardType: TextInputType.text,
                      controller: controller.notification_title,
                      validator: (value) {
                        return validInput(value!, 3, 25, "");
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Message',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.message),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: controller.notification_message,
                      validator: (value) {
                        return validInput(value!, 3, 250, "");
                      },
                    ),
                    SizedBox(height: 40.0),
                    Center(
                      child: CustomButtonLogin(
                        onPressed: () {
                          controller.sendNotification();
                        },
                        buttonName: 'Send',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
