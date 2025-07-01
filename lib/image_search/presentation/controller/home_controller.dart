import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_search/chat/presentation/view/chat_screen.dart';
import 'package:image_search/image_search/domain/model/photo.dart';
import 'package:get/get.dart';
import 'package:image_search/image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/image_search/presentation/view/home_screen.dart';
import 'package:image_search/my/presentation/view/my_screen.dart';
import 'package:image_search/nabor/presentation/view/nabor_screen.dart';
import 'package:image_search/user/presentation/view/user_list_screen.dart';

class HomeController extends GetxController {
  final PhotoApiRepository repository;
  HomeController(this.repository);

  final RxList<Photo> _photos = <Photo>[].obs;
  List<Photo> get photos => _photos;

  
  final _controller = TextEditingController();
  TextEditingController get controller => _controller;
  
  @override
  void onClose() {
    super.onClose();
    _controller.dispose();
  }

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photos.assignAll(result);
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

// class HomeViewModel with ChangeNotifier {
//   //
//   final PhotoApiRepositoryImpl repository;
//   //
//   HomeViewModel(this.repository);

//   List<Photo> _photos = [];

//   UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

//   Future<void> fetch(String query) async {
//     final result = await repository.fetch(query);
//     _photos = result;
//     //
//     notifyListeners();
//   }
// }
// class HomeViewModel {
//   // final PixabayApi api;
//   final PhotoApiRepository repository;
//   HomeViewModel(
//     this.repository,
//   );
//   final _photoScreamController = StreamController<List<Photo>>()..add([]);
//   Stream<List<Photo>> get photoStream => _photoScreamController.stream;


//   Future<void> fetch(String query) async {
//     final result = await repository.fetch(query);
//     _photoScreamController.add(result);
//   }
  
// }
