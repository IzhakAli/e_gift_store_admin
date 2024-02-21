import 'package:e_gift_store_admin/controller/categories/edit_controller.dart';
import 'package:e_gift_store_admin/core/class/handlingdataview.dart';
import 'package:e_gift_store_admin/core/functions/validinput.dart';
import 'package:e_gift_store_admin/core/shared/customtextformglobal.dart';
import 'package:e_gift_store_admin/view/widget/auth/custom_login_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesEdit extends StatelessWidget {
  const CategoriesEdit({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesEditController controller = Get.put(CategoriesEditController());

    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Category"),
        ),
        body: GetBuilder<CategoriesEditController>(
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
                          labelText: "Category Name",
                          prefixIcon: Icon(Icons.category),
                          myController: controller.name,
                          valid: (val) {
                            return validInput(val!, 1, 50, "");
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        CustomTextFormGlobal(
                          labelText: "Category Name in Arabic",
                          prefixIcon: Icon(Icons.category),
                          myController: controller.namear,
                          valid: (val) {
                            return validInput(val!, 1, 50, "");
                          },
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
                              controller.editData();
                            },
                            buttonName: "Edit Category")
                      ],
                    ),
                  ),
                ));
          },
        ));
  }

  // Add this method
  void _showImageSourceSelection(
      BuildContext context, CategoriesEditController controller) {
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
