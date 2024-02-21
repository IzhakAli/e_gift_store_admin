import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/routes.dart';

class ReportOptions extends StatelessWidget {
  const ReportOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reports"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
          Card(
            child: ListTile(
              title: const Text(
                'Sales Report',
                style: TextStyle(fontSize: 20),
              ),
              leading: const Icon(Icons.bar_chart),
              onTap: () => Get.toNamed(AppRoute.salesreport),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text(
                'Customer Feedback',
                style: TextStyle(fontSize: 20),
              ),
              leading: const Icon(Icons.feedback),
              onTap: () => Get.toNamed(AppRoute.customerfeedbackreport),
            ),
          ),
          // Card(
          //   child: ListTile(
          //     title: const Text('Delivery Performance'),
          //     leading: const Icon(Icons.local_shipping),
          //     onTap: () => navigateToReport('DeliveryPerformance'),
          //   ),
          // ),
        ],
      ),
    );
  }
}
