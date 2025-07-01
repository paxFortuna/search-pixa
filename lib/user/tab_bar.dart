import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_search/user/presentation/controller/user_controller.dart';

class UserTabBarScreen extends GetView<UserController> {
  const UserTabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return DefaultTabController(
    length: controller.myTaps.length,
    child: Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text('User List App'),
              centerTitle: true,
              floating: true,
              pinned: true,
              bottom: TabBar(

                tabs: controller.myTaps,
              ),
            ),
          ];
        },
        body: TabBarView(
          children: controller.myTabItems,
        ),
      ),
    ),
  );
}

}
