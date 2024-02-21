import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_gift_store_admin/controller/categories/view_controller.dart';
import 'package:e_gift_store_admin/core/class/handlingdataview.dart';
import 'package:e_gift_store_admin/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/routes.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesViewController());

    return Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.categoriesadd);
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: GetBuilder<CategoriesViewController>(
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
                                        "${AppLink.imageCategory}/${controller.data[index].categoriesImage}",
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
                                                title: 'Delete Category',
                                                content: Text(
                                                    'Are you sure you want to delete this category?'),
                                                onCancel: () {
                                                  print('Deletion cancelled');
                                                },
                                                onConfirm: () {
                                                  controller.deleteCategory(
                                                      controller.data[index]
                                                          .categoriesId!,
                                                      controller.data[index]
                                                          .categoriesImage!);
                                                  print('Category deleted');
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
                                      ],
                                    ),
                                    title: Text(
                                        "${controller.data[index].categoriesName}"),
                                    subtitle: Text(
                                        "${controller.data[index].categoriesDatetime}"),
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
