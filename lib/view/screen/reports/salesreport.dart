import 'package:e_gift_store_admin/core/class/statusrequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/reports/salesreport_controller.dart';

class SalesReport extends StatelessWidget {
  const SalesReport({super.key});

  Future<void> _selectDate(BuildContext context, DateTime initialDate,
      Function(DateTime) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      // You can add builder here to customize the date picker text style
    );
    if (picked != null && picked != initialDate) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Initialize your controller
    final SalesReportController controller = Get.put(SalesReportController());

    // Define text style for buttons
    final TextStyle buttonTextStyle = TextStyle(
      fontSize: 18, // Larger font size
      fontWeight: FontWeight.bold, // Bold text for better readability
    );

    // Define text style for list tiles
    final TextStyle listTileTextStyle = TextStyle(
      fontSize: 16, // Larger font size
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sales Report"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0), // Increased padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      _selectDate(context, controller.startDate, (date) {
                    controller.updateStartDate(date);
                    controller
                        .fetchSalesData(); // Fetch data with new start date
                  }),
                  child: Text(
                    'Start Date: ${DateFormat('yyyy-MM-dd').format(controller.startDate)}',
                    style: buttonTextStyle,
                  ),
                ),
                SizedBox(height: 16), // Add space between buttons
                ElevatedButton(
                  onPressed: () =>
                      _selectDate(context, controller.endDate, (date) {
                    controller.updateEndDate(date);
                    controller.fetchSalesData(); // Fetch data with new end date
                  }),
                  child: Text(
                    'End Date: ${DateFormat('yyyy-MM-dd').format(controller.endDate)}',
                    style: buttonTextStyle,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<SalesReportController>(
              builder: (_) {
                if (controller.statusRequest == StatusRequest.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.statusRequest ==
                    StatusRequest.serverFailure) {
                  return const Center(child: Text('Error fetching data'));
                } else {
                  // Assuming controller.data is a list of sales data
                  return ListView.builder(
                    itemCount: controller.data.length, // Set the item count
                    itemBuilder: (context, index) {
                      // Assuming each item in controller.data has the properties we want to display
                      var sale = controller.data[index];
                      return Column(
                        children: [
                          ListTile(
                            title: Text('Order Date', style: listTileTextStyle),
                            trailing: Text(sale.orderDate.toString(),
                                style: listTileTextStyle),
                          ),
                          ListTile(
                            title:
                                Text('Total Orders', style: listTileTextStyle),
                            trailing: Text('${sale.totalOrders}',
                                style: listTileTextStyle),
                          ),
                          ListTile(
                            title:
                                Text('Total Sales', style: listTileTextStyle),
                            trailing: Text('\$${sale.totalSales}',
                                style: listTileTextStyle),
                          ),
                          ListTile(
                            title: Text('Total Delivery Fees',
                                style: listTileTextStyle),
                            trailing: Text('\$${sale.totalDeliveryFees}',
                                style: listTileTextStyle),
                          ),
                          ListTile(
                            title:
                                Text('Total Revenue', style: listTileTextStyle),
                            trailing: Text('\$${sale.totalRevenue}',
                                style: listTileTextStyle),
                          ),
                          Divider(), // Optional: to visually separate each sale's data
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
