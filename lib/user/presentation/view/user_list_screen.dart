import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_search/a_common/components/app_font.dart';
import 'package:image_search/user/data/data_source/user_api.dart';
import 'package:image_search/user/data/repository_impl/user_api_repository_impl.dart';
import 'package:image_search/user/domain/model/user.dart';
import 'package:image_search/user/presentation/controller.dart/user_controller.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  // 데이터를 비동기적으로 로드할 Future 객체
  late Future<List<User>> usersFuture;
  late final UserController viewModel;
  // final userApi = UserApi();

  @override
  void initState() {
    super.initState();
    // initState에서 데이터 로드 시작
    // _usersFuture =userApi.loadUsers();
    viewModel = Get.put(UserController(UserApiRepositoryImpl(UserApi())));
    usersFuture = viewModel.fetch(); // Future를 미리 저장
  }

  @override
  Widget build(BuildContext context) {
    // final viewModel = Get.put(UserController(UserApiRepositoryImpl(UserApi())));

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        centerTitle: true,
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppFont(
            '가입자 리스트',
            align: TextAlign.center,
          ),
          Expanded(
            child: FutureBuilder<List<User>>(
              // future: viewModel.fetch(),
              future: usersFuture, // loadUsers() 메소드가 반환하는 Future
              builder: (context, snapshot) {
                // 데이터 로딩 중일 때
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                // 에러 발생 시
                else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                // 데이터가 없을 때
                else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No users found.'));
                }
                // 데이터 로드 성공 시
                else {
                  final List<User> users = snapshot.data!;
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(user.id), // ID를 아바타에 표시
                        ),
                        title: Text(user.name),
                        subtitle: Text(user.email),
                        onTap: () {
                          // ListTile 탭 시 동작 (예: 상세 화면으로 이동)
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Tapped on ${user.name} (${user.id})',
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
