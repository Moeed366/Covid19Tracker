import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Country_controller.dart';

class data_show extends GetxController{
  var choice = 'tracker';
  var cases = 0.obs;
  var recovered = 0.obs;
  var active = 0.obs;
  var decreased = 0.obs;
  var graph;
  final c=Get.find<Country_controller>();

  data_show(find);

  void country(){
    //final c=Get.find<Country_controller>();
      Get.find<Country_controller>().getData();
      for(int i=0;i<c.list.length;i++)
      {
        cases=c.list[0].rows![i].newDeaths as RxInt;
        recovered=c.list[0].rows![i].totalRecovered as RxInt;
        active=c.list[0].rows![i].activeCases as RxInt;
        //decreased= cases-recovered;
      }
      print("-----------------------------------------$cases");


  }
}