import 'package:image_search/user_list/domain/model/user.dart';

abstract class UserApiRepository {
  Future<List<User>> fetch();
}