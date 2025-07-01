import 'package:get/get.dart';
import 'package:image_search/data/data_source/user_api.dart';
import 'package:image_search/data/repository/user_api_repository_impl.dart';
import 'package:image_search/domain/repository/user_api_repository.dart';
import 'package:image_search/presentation/user/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserApi());
    Get.lazyPut<UserApiRepository>(() => UserApiRepositoryImpl(Get.find<UserApi>()));
    Get.lazyPut(() => UserController(Get.find<UserApiRepository>()));
  }
}