
import 'package:charts_painter/chart.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:covid19/controller/Country_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:syncfusion_flutter_charts/charts.dart';


class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard>with SingleTickerProviderStateMixin {


  late TabController _tabController;
  var choice = 'tracker';
  var cases = 0;
  var recovered = 0;
  var active = 0;
  var decreased = 0;
  var graph;
  String? selectedcountry;
  @override
  // late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    _tabController = TabController(length: 2, vsync: this);
    String a = _tabController.toString();
    //country();
    final c=Get.find<Country_controller>();
    Get.find<Country_controller>().getData();
    for(int i=0;i<c.list.length;i++)
    {
      cases=c.list[0].rows![i].newDeaths as int;
      recovered=c.list[0].rows![i].totalRecovered as int;
      active=c.list[0].rows![i].activeCases as int;
      decreased= cases-recovered;
      print(cases);
    }
    //print("llllllllllllllll$_tooltip");
    // getHTTP();
    // getcountrycases();
    // getscheduled();
    //getH();
    //getgraphHTTP();
    //getcountrycases();
    // Country();






    super.initState();
  }

  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(backgroundColor: Colors.white, elevation: 0,
      leading: Container(height: 3,
        width: 40,
        child: Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/SARS-CoV-2_without_background.png/1020px-SARS-CoV-2_without_background.png"),
      ),

      // title: Text("Covid 19"),
      actions: <Widget>[
        Container(

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 80, height: 1, decoration: BoxDecoration(color: Color(
                0x66e2e0e0),

              /* border: Border.all(
                  color: const Color(0xFFBFBEBE),
                  width: 0.0,
                  style: BorderStyle.solid), */ //Border.all
              /*** The BorderRadius widget is here ***/
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ), //BorderRadius.all
            ),
              child: CountryListPick(

                appBar: AppBar(
                  backgroundColor: Colors.amber,
                  title: const Text('Pick your country'),
                ),
                // if you need custom picker use this
                // pickerBuilder: (context, CountryCode countryCode) {
                //   return Row(
                //     children: [
                //       Image.asset(
                //         countryCode.flagUri,
                //         package: 'country_list_pick',
                //       ),
                //       Text(countryCode.code),
                //       Text(countryCode.dialCode),
                //     ],
                //   );
                // },
                theme: CountryTheme(
                  isShowFlag: true,
                  isShowTitle: false,
                  isShowCode: false,
                  isDownIcon: true,
                  showEnglishName: false,
                  labelColor: Colors.black,

                ),
                //initialSelection: '+62',
                // or
                initialSelection: 'Pakistan',
                onChanged: (CountryCode? code) {


                  selectedcountry = code?.name;


                  //Country();

                },
              ),
            ),
          ), //BoxDecoration
        ),

      ],),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Stack(
                  clipBehavior: Clip.none, children: [

                  Card(
                    shape: RoundedRectangleBorder(

                        borderRadius:

                        BorderRadius.all(Radius.circular(20.0))),
                    elevation: 1,

                    color: Color(0xff99D3FF),
                    child: Container(
                      //width: 250,
                      height: 160.h,
                    ),
                  ),
                  Positioned(
                      top: -17,
                      left: 10,
                      child: Container(
                        // elevation: 3,
                        //color: Colors.orange,
                        child: Image.asset("assets/doctor.png"),
                      )),
                  Positioned(
                      top: 20,
                      left: 170,
                      child: Container(
                        // elevation: 3,
                        //color: Colors.orange,
                        child: Text(
                          "Know safety Tips and\n Precautions from\n Top Doctor",
                          style: TextStyle(fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),),

                      )),
                  Positioned(
                    top: 100,
                    left: 170,
                    child: Container(height: 25,
                      width: 50,
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          // Add your onPressed code here!
                        },
                        label: const Text(''),
                        icon: const Icon(Icons.arrow_right_alt_sharp),
                        backgroundColor: Color.fromRGBO(145, 86, 236, 1),
                      ),),),


                ],
                ),
                Positioned(top: 300, child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // give the tab bar a height [can change hheight to preferred height]
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Color(0xffF49E6F),
                            borderRadius: BorderRadius.circular(
                              25.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: TabBar(
                              controller: _tabController,
                              // give the indicator a decoration (color and border radius)
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  25.0,
                                ),
                                color: Colors.white,
                              ),
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.black,
                              tabs: [
                                // first tab [you can add an icon using the icon property]
                                Tab(
                                  text: 'Tracker',
                                ),

                                // second tab [you can add an icon using the icon property]
                                Tab(
                                  text: 'Symptoms',
                                ),
                              ],

                            ),
                          ),
                        ),
                        // tab bar view here

                      ],
                    ),
                  ),)),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: DefaultTabController(

                      length: 4, // length of tabs
                      initialIndex: 0,
                      child: Column(children: <Widget>[
                        Container(width: 400,
                          child: TabBar(
                            padding: EdgeInsets.zero,
                            indicatorPadding: EdgeInsets.zero,
                            labelPadding: EdgeInsets.zero,
                            indicatorColor: Colors.white,
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              Tab(text: 'Country',),
                              Tab(text: 'State'),
                              Tab(text: 'City'),
                              Tab(text: 'Worldwide'),
                            ],
                          ),
                        ),

                      ])
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

                  Card(

                    shape: RoundedRectangleBorder(

                        borderRadius:

                        BorderRadius.all(Radius.circular(20.0))),
                    elevation: 1,

                    color: Color.fromRGBO(241, 198, 207, 0.9803921568627451),

                    child: Container(

                      width: 160.w,

                      height: 140.h,

                      child: Stack(

                        children: [

                          Padding(

                            padding: const EdgeInsets.only(left: 15, top: 15),

                            child: Text("Confirmed", style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(252, 20, 65, 1),),),

                          ),

                          Padding(

                            padding: const EdgeInsets.only(left: 30, top: 80),

                            child: Text("$cases", style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffFC1441)),),

                          ),


                        ],


                      ),

                    ),

                  ),

                  Card(


                    shape: RoundedRectangleBorder(

                        borderRadius:

                        BorderRadius.all(Radius.circular(20.0))),

                    elevation: 1,

                    color: Color.fromRGBO(200, 224, 252, 1.0),

                    child: Container(

                      width: 160.w,

                      height: 140.h,

                      child: Stack(

                        children: [

                          Padding(

                            padding: const EdgeInsets.only(left: 15, top: 15),

                            child: Text("Active", style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff157FFB)),),

                          ),

                          Padding(

                            padding: const EdgeInsets.only(left: 30, top: 80),

                            child: Text("$active", style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff157FFB)),),

                          ),


                        ],


                      ),

                    ),

                  ),


                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

                  Card(

                    shape: RoundedRectangleBorder(

                        borderRadius:

                        BorderRadius.all(Radius.circular(20.0))),

                    elevation: 1,

                    color: Color.fromRGBO(200, 253, 211, 1.0),

                    child: Container(

                      width: 160.w,

                      height: 140.h,

                      child: Stack(

                        children: [

                          Padding(

                            padding: const EdgeInsets.only(left: 15, top: 15),

                            child: Text("Recovered", style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff30A64A)),),

                          ),

                          Padding(

                            padding: const EdgeInsets.only(left: 30, top: 80),

                            child: Text("$recovered", style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(
                                    0xff30A64A)),),

                          ),


                        ],


                      ),

                    ),

                  ),

                  Card(


                    shape: RoundedRectangleBorder(

                        borderRadius:

                        BorderRadius.all(Radius.circular(20.0))),

                    elevation: 1,

                    color: Color.fromRGBO(232, 238, 246, 1.0),

                    child: Container(

                      width: 160.w,

                      height: 140.h,

                      child: Stack(

                        children: [

                          Padding(

                            padding: const EdgeInsets.only(left: 15, top: 15),

                            child: Text("Decreased", style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(
                                    0xff6D757D)),),

                          ),

                          Padding(

                            padding: const EdgeInsets.only(left: 30, top: 80),

                            child: Text("$decreased", style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(
                                    0xff6D757D)),),

                          ),


                        ],


                      ),


                    ),

                  ),


                ],),
                Container(height: 30.sp, width: MediaQuery
                    .of(context)
                    .size
                    .width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text("Spread Trends", style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),),
                    )),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Chart<void>(
                    height: 300.0.h,
                    state: ChartState(
                      ChartData.
                      fromList([
                        1,
                        3,
                        4,
                        2,
                        7,
                        6,
                        2,
                        5,
                        4,
                        4,
                        7,
                        5,
                        3,
                        4,
                        6,
                        7,
                        4,
                        4,
                        2,
                        6,
                        8,
                        5,
                        6,
                        5,
                        3,
                        2,
                        3,
                        4,
                        5,
                        6,
                        7,
                        6,
                        7,
                        7,
                        7,
                        2,
                        3,
                        4,
                        5,
                        7,
                        5,
                        5,
                        4,
                        5,
                        4,
                        5,
                        3,
                        4,
                        3,
                        4,
                        2,
                        2,
                        6,
                        4
                      ]
                          .map((e) => BarValue<void>(e.toDouble())).toList(),
                        axisMax: 8.0,
                      ),
                      itemOptions: BarItemOptions(

                        color: Color(0xff9156EC),
                        padding: const EdgeInsets.symmetric(horizontal: 1.0),
                        radius: BorderRadius.vertical(top: Radius.circular(
                            42.0)),
                      ),

                      /* backgroundDecorations: [
                  GridDecoration(
                    verticalAxisStep: 5,
                    horizontalAxisStep: 5,
                  ),
                ],
                foregroundDecorations: [
                  BorderDecoration(borderWidth: 0.0),
                ],*/
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void country(){


    setState(() {
      final c=Get.find<Country_controller>();
      Get.find<Country_controller>().getData();
      for(int i=0;i<c.list.length;i++)
      {
        cases=c.list[0].rows![i].newDeaths as int;
        recovered=c.list[0].rows![i].totalRecovered as int;
        active=c.list[0].rows![i].activeCases as int;
        decreased= cases-recovered;
      }
      print("-----------------------------------------$cases");

    });
  }
}










