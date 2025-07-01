import 'package:image_search/data/data_source/user_api.dart';
import 'package:image_search/domain/model/user.dart';
import 'package:image_search/domain/repository/user_api_repository.dart';

class UserApiRepositoryImpl implements UserApiRepository {
 final UserApi userApi;
  UserApiRepositoryImpl(this.userApi);
  
  @override
  Future<List<User>> fetch() async{
    final result =await userApi.loadUsers();
    return result;
  }
}