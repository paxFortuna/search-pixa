import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/data/repository/photo_api_repository_impl.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/presentation/home/home_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => http.Client());
    Get.lazyPut(() => PixabayApi(Get.find<http.Client>()));
    Get.lazyPut<PhotoApiRepository>(() => PhotoApiRepositoryImpl(Get.find<PixabayApi>()));
    Get.lazyPut(() => HomeController(Get.find<PhotoApiRepository>()));
  }
}
