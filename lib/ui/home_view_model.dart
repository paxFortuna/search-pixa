// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:image_search/data/pixabay_api.dart';
import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo.dart';

class HomeViewModel {
  // final PixabayApi api;
  final PhotoApiRepository repository;
  HomeViewModel(
    this.repository,
  );

  final _photoScreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoScreamController.stream;


  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photoScreamController.add(result);
  }
  
}
