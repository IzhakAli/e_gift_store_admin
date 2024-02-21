import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../view/screen/orders/accepted.dart';
import '../../view/screen/orders/archive.dart';
import '../../view/screen/orders/pending.dart';

abstract class OrderScreenController extends GetxController {
  changePage(int currentpage);
}

class OrderScreenControllerImp extends OrderScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const OrdersPending(),
    const OrdersAccepted(),
    const OrdersArchiveView()
  ];

  List bottomappbar = [
    {"title": "Pending", "icon": Icons.pending},
    {"title": "Accepted", "icon": Icons.check_box_rounded},
    {"title": "Archive", "icon": Icons.archive},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
