class SalesRevenueModel {
  String? orderDate;
  int? totalOrders;
  String? totalSales;
  String? totalDeliveryFees;
  int? totalRevenue;
  int? ordersStatus;

  SalesRevenueModel(
      {this.orderDate,
      this.totalOrders,
      this.totalSales,
      this.totalDeliveryFees,
      this.totalRevenue,
      this.ordersStatus});

  SalesRevenueModel.fromJson(Map<String, dynamic> json) {
    orderDate = json['order_date'];
    totalOrders = json['total_orders'];
    totalSales = json['total_sales'];
    totalDeliveryFees = json['total_delivery_fees'];
    totalRevenue = json['total_revenue'];
    ordersStatus = json['orders_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_date'] = this.orderDate;
    data['total_orders'] = this.totalOrders;
    data['total_sales'] = this.totalSales;
    data['total_delivery_fees'] = this.totalDeliveryFees;
    data['total_revenue'] = this.totalRevenue;
    data['orders_status'] = this.ordersStatus;
    return data;
  }
}
