import 'package:e_gift_store_admin/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../core/constant/routes.dart';
import '../widget/home/cardadmin.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView(
        children: [
          GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisExtent: 200),
            children: [
              CardAdminHome(
                url: AppImageAsset.categories,
                title: 'Categories',
                onClick: () {
                  Get.toNamed(AppRoute.categoriesview);
                },
              ),
              CardAdminHome(
                url: AppImageAsset.products,
                title: 'Items',
                onClick: () {
                  Get.toNamed(AppRoute.itemsview);
                },
              ),
              // CardAdminHome(
              //   url: AppImageAsset.users,
              //   title: 'Users',
              //   onClick: () {},
              // ),
              CardAdminHome(
                url: AppImageAsset.orders,
                title: 'Orders',
                onClick: () {
                  Get.toNamed(AppRoute.ordersscreen);
                },
              ),
              CardAdminHome(
                url: AppImageAsset.reports,
                title: 'Reports',
                onClick: () {
                  Get.toNamed(AppRoute.reportoptions);
                },
              ),
              CardAdminHome(
                url: AppImageAsset.notifications,
                title: 'Notifications',
                onClick: () {
                  Get.toNamed(AppRoute.notifications);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
