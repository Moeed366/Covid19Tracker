import 'dart:convert';
import 'dart:ffi';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:charts_painter/chart.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'dashboard_page.dart';

class started extends StatelessWidget {
  const started({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Color.fromRGBO(185, 226, 238, 0.9803921568627451),
        child: Column(
          children: [Expanded(child: Image.asset("assets/Illustration.png",fit:BoxFit.cover,width:MediaQuery.of(context).size.width),),
          Container(
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                )
            ),
            child: Container(height: 270,
              child: Column(
                children: [
                  Container(width:MediaQuery.of(context).size.width,child:
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 30),
                    child: Text("Be aware\nStay Healthy",style: TextStyle(fontSize: 35,),),
                  ),),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text("Welcome to COVID-19 information Portal.",style: TextStyle(fontSize: 15,color: Color.fromRGBO(146, 145, 145, 1.0)),),
                ),
              ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 200,top: 30),
                      child: Row(
                        children: [
                          Text("GET STARTED",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color.fromRGBO(146, 145, 145, 1.0)),),
                          RawMaterialButton(
                            onPressed: () {
                             // casesapi();
                              //getHTTP();
                              Get.to(dashboard());
                            },
                            elevation: 2.0,
                            fillColor: Color(0xff9156EC),
                            child: Icon(
                              Icons.arrow_forward_sharp,
                              color: Colors.white,
                              size: 35.0,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )],
        ),
      ),
    );
  }

}
