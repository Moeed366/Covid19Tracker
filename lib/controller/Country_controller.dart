import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../model/post_model.dart';
import '../services/api_services.dart';

class Country_controller extends GetxController {
  final ApiService apiService;
  Country_controller({required this.apiService});
  List<Data>list=[];

  Future<void> getData() async {
    final response = await apiService.getCountryData();

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.toString());
      if (map['status'] == 'success') {
        list = [];
        list.add(Data.fromJson(map['data']));
        print('************************* Printing UserName');
        print(list[0].paginationMeta!.currentPage.toString());
      } else {}
    } else {
      Get.snackbar("Connection Error", "Internal server error");
    }
    update();
  }
}
