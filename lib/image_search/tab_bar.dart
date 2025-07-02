import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_search/a_common/components/bottom_modal_sheet.dart';
import 'package:image_search/a_common/components/confirm_modal.dart';
import 'package:image_search/image_search/presentation/controller/home_controller.dart';

class TabBarScreen extends GetView<HomeController> {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String data = '1';

    return DefaultTabController(
      length: controller.myTaps.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text('Image Search App'),
                centerTitle: true,
                floating: true,
                pinned: true,
                bottom: TabBar(
                  tabs: controller.myTaps,
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return BottomModalSheet(
                            delete: data == '1'
                                ? () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return ConfirmModal(
                                          title: '삭제하기',
                                          message:
                                              '이 글을 삭제하시겠습니까? 삭제한 글은 다시 볼 수 없습니다.',
                                          cancel: () {
                                            Navigator.pop(context);
                                          },
                                          confirmAction: () async {
                                            //  bool result = await feedController.feedDelete(data.id);
                                            // if(result)
                                            // {Navigator.pop(context);
                                            //  Navigator.pop(context);}
                                          },
                                          confirmText: '삭제하기',
                                        );
                                      },
                                    );
                                  }
                                : null,
                            //
                            cancelTap: () {
                              Navigator.pop(context);
                            },
                            // 원하는 함수 실행, 글 숨기기
                            hideTap: () {
                              showDialog(context: context, builder: (context){
                                return ConfirmModal(
                                  title: '글 숨기기',
                                  message: '이 글을 숨기시겠습니까? 다시 볼 수 없습니다.',
                                  confirmText: '숨기기',
                                  confirmAction: (){
                                    // 글을 숨기는 로직 구현
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  cancel: (){
                                    Navigator.pop(context);
                                  },
                                );
                              });
                            },
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.notifications_none_rounded),
                  ),
                ],
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
