import 'package:covid19/controller/Country_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:flutter/material.dart';

class PostList extends StatefulWidget {
  PostList({Key? key}) : super(key: key);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {


  @override
  Widget build(BuildContext context) {
   final c=Get.find<Country_controller>();
   Get.find<Country_controller>().getData();
    return Container(color: Colors.red,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child:
           SizedBox(
             height: 700,
             width: 400,
             child: ListView.builder(
                itemCount: c.list.length,
                itemBuilder: (BuildContext, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(c.list[0].paginationMeta!.currentPage.toString()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(c.list[0].rows![index].newDeaths.toString()),
                      ),
                    ],
                  );
                }),
           ),
    );
  }
}
