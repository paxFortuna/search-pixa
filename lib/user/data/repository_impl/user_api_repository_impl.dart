import 'package:image_search/user/data/data_source/user_api.dart';
import 'package:image_search/user/domain/model/user.dart';
import 'package:image_search/user/domain/repository/user_api_repository.dart';

class UserApiRepositoryImpl implements UserApiRepository {
 final UserApi userApi;
  UserApiRepositoryImpl(this.userApi);
  
  @override
  Future<List<User>> fetch() async{
    final result =await userApi.loadUsers();
    return result;
  }
}