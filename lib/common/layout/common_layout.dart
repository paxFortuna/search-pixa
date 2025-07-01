import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_search/common/controller/common_layout_controller.dart';

import '../components/loading.dart';

class CommonLayout extends GetView<CommonLayoutController> {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavBar;
  final Widget? floatingActionButton;
  final bool userSafeArea;

  const CommonLayout({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavBar,
    this.floatingActionButton,
    this.userSafeArea = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Obx(
        ()=> Stack(
          fit: StackFit.expand,
          children: [
            Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: appBar,
              backgroundColor: const Color(0xff212123),
              body: userSafeArea ? SafeArea(child: body) : body,
              bottomNavigationBar: bottomNavBar ?? const SizedBox(height: 1),
              floatingActionButton: floatingActionButton,
            ),
            controller.isLoading.value ? const Loading() : Container(),
          ],
        ),
      ),
    );
  }
}
