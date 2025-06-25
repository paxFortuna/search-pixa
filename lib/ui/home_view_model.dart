// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:image_search/data/api.dart';
import 'package:image_search/model/photo.dart';

class HomeViewModel {
  final PixabayApi api;
  HomeViewModel(
    this.api,
  );

  final _photoScreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoScreamController.stream;


  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoScreamController.add(result);
  }
  
}
