
import 'package:covid19/pages/dashboard_page.dart';
import 'package:covid19/pages/post_list.dart';
import 'package:covid19/pages/startup_page.dart';
import 'package:covid19/pages/test.dart';
import 'package:covid19/services/init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async{
  await initData();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(

              primarySwatch: Colors.blue,
            ),
            home: login(),
          );
        });
  }
}
