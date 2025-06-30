import 'dart:async';import 'package:image_search/domain/model/photo.dart';
import 'package:get/get.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';

class HomeController extends GetxController {
  final PhotoApiRepository repository;
  HomeController(this.repository);

  final RxList<Photo> _photos = <Photo>[].obs;

  List<Photo> get photos => _photos;

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photos.assignAll(result);
  }
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
