
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SingleTickerProvider extends State with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    //_tooltip = TooltipBehavior(enable: true);
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
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

    );
    throw UnimplementedError();
  }
  // SingleTickerProvider({Key? key}) : super(key: key);






}