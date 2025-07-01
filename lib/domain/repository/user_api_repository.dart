import 'package:image_search/domain/model/user.dart';

abstract class UserApiRepository {
  Future<List<User>> fetch();
}