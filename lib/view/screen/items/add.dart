import 'package:e_gift_store_admin/controller/items/add_controller.dart';
import 'package:e_gift_store_admin/core/class/handlingdataview.dart';
import 'package:e_gift_store_admin/core/functions/validinput.dart';
import 'package:e_gift_store_admin/core/shared/customtextformglobal.dart';
import 'package:e_gift_store_admin/view/widget/auth/custom_login_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/shared/customdropdownsearch.dart';

class ItemsAdd extends StatelessWidget {
  const ItemsAdd({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsAddController controller = Get.put(ItemsAddController());

    return Scaffold(
        appBar: AppBar(
          title: Text("Add Item"),
        ),
        body: GetBuilder<ItemsAddController>(
          builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        CustomTextFormGlobal(
                          textInputAction: TextInputAction.next,
                          labelText: "Name",
                          prefixIcon: Icon(Icons.label_important),
                          myController: controller.name,
                          valid: (val) {
                            return validInput(val!, 1, 50, "");
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        CustomTextFormGlobal(
                          textInputAction: TextInputAction.next,
                          labelText: "Name [Arabic]",
                          prefixIcon: Icon(Icons.label_important),
                          myController: controller.namear,
                          valid: (val) {
                            return validInput(val!, 1, 50, "");
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        CustomTextFormGlobal(
                          textInputAction: TextInputAction.next,
                          labelText: "Description",
                          prefixIcon: Icon(Icons.label_important),
                          myController: controller.desc,
                          valid: (val) {
                            return validInput(val!, 1, 200, "");
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        CustomTextFormGlobal(
                          textInputAction: TextInputAction.next,
                          labelText: "Description [Arabic]",
                          prefixIcon: Icon(Icons.label_important),
                          myController: controller.descar,
                          valid: (val) {
                            return validInput(val!, 1, 200, "");
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        CustomTextFormGlobal(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          labelText: "Available Quantity",
                          prefixIcon: Icon(Icons.label_important),
                          myController: controller.count,
                          valid: (val) {
                            return validInput(val!, 1, 50, "");
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        CustomTextFormGlobal(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          labelText: "Price",
                          prefixIcon: Icon(Icons.label_important),
                          myController: controller.price,
                          valid: (val) {
                            return validInput(val!, 1, 50, "");
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        CustomTextFormGlobal(
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          labelText: "Discount",
                          prefixIcon: Icon(Icons.label_important),
                          myController: controller.discount,
                          valid: (val) {
                            return validInput(val!, 1, 50, "");
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        CustomDropdownSearch(
                          title: "Choose Category",
                          listdata: controller.dropdownlist,
                          dropdownSelectedName: controller.catname,
                          dropdownSelectedID: controller.catid,
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _showImageSourceSelection(context, controller);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.purple, // Text color
                            elevation: 5,
                            shadowColor: Colors.purpleAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize
                                .min, // To make the button wrap its content
                            children: [
                              Icon(Icons.image, size: 24), // Button icon
                              SizedBox(
                                  width: 10), // Spacing between icon and text
                              Text(
                                'Choose Image',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.05,
                        ),
                        controller.file == null
                            ? Container(
                                height: Get.height * 0.3,
                                width: Get.width * 0.4,
                                child: Text('No image selected.'))
                            : Container(
                                height: Get.height * 0.3,
                                width: Get.width * 0.4,
                                child: Image.file(
                                  controller.file!,
                                  height: 80,
                                ),
                              ),
                        SizedBox(
                          height: Get.height * 0.1,
                        ),
                        CustomButtonLogin(
                            onPressed: () {
                              controller.addData();
                            },
                            buttonName: "Add Item")
                      ],
                    ),
                  ),
                ));
          },
        ));
  }

  // Add this method
  void _showImageSourceSelection(
      BuildContext context, ItemsAddController controller) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16),
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera'),
              onTap: () {
                controller.chooseImageFromCamera();
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () {
                controller.chooseImageFromGallery();
                Get.back();
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Colors.grey,
          style: BorderStyle.solid,
          width: 2.0,
        ),
      ),
    );
  }
}
