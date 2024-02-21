import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/reports/customerfeedback_controller.dart';
import '../../../core/class/statusrequest.dart';

class CustomerFeedbackReport extends StatelessWidget {
  const CustomerFeedbackReport({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the instance of your CustomerFeedbackController
    final CustomerFeedbackController controller =
        Get.put(CustomerFeedbackController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Feedback"),
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: GetBuilder<CustomerFeedbackController>(
        builder: (_) {
          if (controller.statusRequest == StatusRequest.loading) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.blueGrey), // Consistent color scheme
              ),
            );
          } else if (controller.statusRequest == StatusRequest.failure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.error_outline,
                      color: Colors.red, size: 50), // Visual feedback for error
                  SizedBox(height: 10),
                  Text("Failed to fetch data.", style: TextStyle(fontSize: 18)),
                ],
              ),
            );
          } else if (controller.statusRequest == StatusRequest.success) {
            return ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                final item = controller.data[index];
                return Card(
                  // Use Card for list items
                  margin: const EdgeInsets.all(8), // Add margin around the card
                  child: ListTile(
                    title: Text("Order ID: ${item['orders_id']}",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0), // Add padding for better layout
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("User ID: ${item['orders_usersid']}"),
                          Text("Rating: ${item['orders_rating']}"),
                          Text("Note: ${item['orders_noterating']}"),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("No data available."));
          }
        },
      ),
    );
  }
}
