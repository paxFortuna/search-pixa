import 'package:flutter/material.dart';
import 'package:image_search/a_common/components/app_font.dart';
import 'package:image_search/user/domain/model/user.dart';

class UserDetailPage extends StatelessWidget {
  final User user;
  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     Get.offNamed('/');
        //   },
        //   icon: Icon(Icons.arrow_back_sharp),
        // ),
        title: Text('${user.id}님을 불어옴'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppFont('${user.name} 님 반갑습니다.'),
            const SizedBox(height: 20),
            AppFont('이메일 주소는 ${user.email} 입니다.'),
          ],
        ),
      ),
    );
  }
}
