import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:image_search/presentation/bottom_nav_binding.dart';
import 'package:image_search/presentation/home/initial_binding.dart';
import 'package:image_search/presentation/home/home_screen.dart';
import 'package:image_search/presentation/root.dart';
import 'package:image_search/presentation/tab_bar.dart';
import 'package:image_search/presentation/user/user_binding.dart';
import 'package:image_search/presentation/user/user_list_screen.dart';

void main() async {
  await dotenv.load(fileName: "assets/config/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: PhotoProvider(
      //   viewModel: HomeViewModel(PixabayApi()),
      //   child: const HomeScreen(),
      //   ),
      // home: ChangeNotifierProvider(
      //   create: (_) =>
      //       HomeViewModel(PhotoApiRepositoryImpl(PixabayApi(http.Client()))),
      //   child: const HomeScreen(),
      // ),
      initialBinding: InitialBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const Root(),
          binding: BottomNavBinding(),
        ),
        // 아래 두 라우트는 initailBinding됨. 다른 콘트롤러 있는 라우트는 binding해줘야 함.
        GetPage(name: '/tab', page: () => const TabBarScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(
          name: '/user',
          page: () => const UserListScreen(),
          binding: UserBinding(),
        ),
      ],
    );
  }
}
