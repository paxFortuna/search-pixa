import 'package:get/get.dart';
import 'package:image_search/user/data/data_source/user_api.dart';
import 'package:image_search/user/data/repository_impl/user_api_repository_impl.dart';
import 'package:image_search/user/domain/repository/user_api_repository.dart';
import 'package:image_search/user/presentation/controller.dart/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserApi());
    Get.lazyPut<UserApiRepository>(() => UserApiRepositoryImpl(Get.find<UserApi>()));
    Get.lazyPut(() => UserController(Get.find<UserApiRepository>()));
  }
}