import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_gift_store_admin/controller/items/view_controller.dart';
import 'package:e_gift_store_admin/core/class/handlingdataview.dart';
import 'package:e_gift_store_admin/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/routes.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsViewController());

    return Scaffold(
        appBar: AppBar(
          title: Text("Items"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.itemssadd);
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: GetBuilder<ItemsViewController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: WillPopScope(
                onWillPop: () {
                  return controller.myback();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller.goToPageEdit(controller.data[index]);
                        },
                        child: Card(
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "${AppLink.imageItems}/${controller.data[index].itemsImage}",
                                    height: 100,
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: ListTile(
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Get.defaultDialog(
                                                title: 'Delete Item',
                                                content: Text(
                                                    'Are you sure you want to delete this Item?'),
                                                onCancel: () {
                                                  print('Deletion cancelled');
                                                },
                                                onConfirm: () {
                                                  controller.deleteItem(
                                                      controller
                                                          .data[index].itemsId
                                                          .toString()!,
                                                      controller.data[index]
                                                          .itemsImage!);
                                                  print('Item  deleted');
                                                  Get.back(); // Close the dialog
                                                },
                                                textCancel: 'Cancel',
                                                textConfirm: 'Yes',
                                                confirmTextColor: Colors.white,
                                                buttonColor: Theme.of(context)
                                                    .primaryColor, // Use your theme color here
                                              );
                                            },
                                            icon: Icon(Icons.delete)),
                                        // IconButton(
                                        //     onPressed: () {
                                        //       controller.goToPageEdit(
                                        //           controller.data[index]);
                                        //     },
                                        //     icon: Icon(Icons.edit)),
                                      ],
                                    ),
                                    title: Text(
                                        "${controller.data[index].itemsName}"),
                                    subtitle: Text(
                                        "${controller.data[index].categoriesName}"),
                                  ))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )),
        ));
  }
}
