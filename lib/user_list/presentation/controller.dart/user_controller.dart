import 'package:get/get.dart';
import 'package:image_search/user_list/domain/model/user.dart';
import 'package:image_search/user_list/domain/repository/user_api_repository.dart';

class UserController extends GetxController {
  final UserApiRepository userApiRepository;

  UserController(this.userApiRepository);
  final RxList<User> _users = <User>[].obs;

  List<User> get users => _users;

  Future<List<User>> fetch() async {
    final result = await userApiRepository.fetch();
    _users.value = result;
    return _users.toList(); // toList() 없어도 됨.
  }
}
