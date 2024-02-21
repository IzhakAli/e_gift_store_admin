import 'dart:io';

import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class CategoriesData {
  Crud crud;

  CategoriesData(this.crud);

  get() async {
    var response = await crud.postData(AppLink.categoriesview, {});
    return response.fold((l) => l, (r) => r);
  }

  add(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.categoriesadd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    var response = await crud.postData(AppLink.categoriesdelete, data);
    return response.fold((l) => l, (r) => r);
  }

  edit(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.categoriesedit, data);
    } else {
      response =
          await crud.addRequestWithImageOne(AppLink.categoriesedit, data, file);
    }

    // Check if response is null before calling fold
    if (response == null) {
      // Handle the null case, maybe return an error or throw an exception
      print('Error: Response is null');
      return; // or throw an exception, or return a default value
    }

    return response.fold((l) => l, (r) => r);
  }
}
