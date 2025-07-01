import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
import 'package:image_search/image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/image_search/data/repository_impl/photo_api_repository_impl.dart';
import 'package:image_search/image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/image_search/presentation/home/home_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // 생성자가 있는 경우 Get.find<생성자>()를 생성자로 넣어줘야 한다.
    // Get.lazyPut(() => http.Client());
    // Get.lazyPut(() => PixabayApi(Get.find<http.Client>()));
    Get.lazyPut(() => PixabayApi());
    Get.lazyPut<PhotoApiRepository>(
      () => PhotoApiRepositoryImpl(Get.find<PixabayApi>()));
    Get.lazyPut(() => HomeController(Get.find<PhotoApiRepository>()));
  }
}
