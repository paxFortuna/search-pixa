import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_search/chat/presentation/view/chat_screen.dart';
import 'package:image_search/image_search/presentation/view/home_screen.dart';
import 'package:image_search/my/presentation/view/my_screen.dart';
import 'package:image_search/nabor/presentation/view/nabor_screen.dart';
import 'package:image_search/user/domain/model/user.dart';
import 'package:image_search/user/domain/repository/user_api_repository.dart';
import 'package:image_search/user/presentation/view/user_list_screen.dart';

class UserController extends GetxController {
  final UserApiRepository userApiRepository;

  UserController(this.userApiRepository);

  final _controller = TextEditingController();
  //
  TextEditingController get controller => _controller;
  final RxList<User> _users = <User>[].obs;

  List<User> get users => _users;

  Future<List<User>> fetch() async {
    final result = await userApiRepository.fetch();
    _users.value = result;
    return _users.toList(); // toList() 없어도 됨.
  }

  
  // RxList로 선언하고 초기값을 지정합니다.
  RxList<Tab> myTaps = <Tab>[
    Tab(icon: Icon(Icons.home), text: '홈'),
    Tab(icon: Icon(Icons.feed), text: '유저'),
    Tab(icon: Icon(Icons.feed), text: '동네'),
    Tab(icon: Icon(Icons.chat_bubble_outline_rounded), text: '채팅'),
    Tab(icon: Icon(Icons.person_2_outlined), text: '마이'),
  ].obs;

  final RxList<Widget> myTabItems=[
    const HomeScreen(),
    const UserListScreen(),
    const ChatScreen(),
    const NaborScreen(),
    const MyScreen(),
  ].obs;

}
