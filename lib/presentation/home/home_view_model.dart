import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:image_search/data/repository/photo_api_repository_impl.dart';
import 'package:image_search/domain/model/photo.dart';

class HomeViewModel with ChangeNotifier {
  //
  final PhotoApiRepositoryImpl repository;
  //
  HomeViewModel(this.repository);

  List<Photo> _photos = [];

  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photos = result;
    //
    notifyListeners();
  }
}
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
