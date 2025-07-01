import 'package:image_search/user/domain/model/user.dart';

abstract class UserApiRepository {
  Future<List<User>> fetch();
}