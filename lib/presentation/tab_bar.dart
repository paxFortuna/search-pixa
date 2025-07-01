import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_search/presentation/home/home_controller.dart';

class TabBarScreen extends GetView<HomeController> {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.myTaps.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Image Search App'),
          centerTitle: true,
          bottom: TabBar(
            tabs: controller.myTaps,
          ),
        ),
        body: TabBarView(children: controller.myTabItems),
      ),
    );
  }
}
