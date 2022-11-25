
import 'package:covid19/controller/data_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/Country_controller.dart';
import 'api_services.dart';
import 'network_client.dart';


Future<void> initData() async {
  Get.lazyPut(() => NetworkClient());

  Get.lazyPut(() => ApiService(networkClient: Get.find()));

  //Controllers
  Get.lazyPut(() => Country_controller(apiService: Get.find()));

  Get.lazyPut(() => data_show( Get.find()));

  //Demage Report Controller

  //Apis Client

  // String userToken = sharedP.getString('UserToken')!;
}
