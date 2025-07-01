

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_search/a_common/bindings/bottom_nav_binding.dart';
import 'package:image_search/image_search/presentation/binding/initial_binding.dart';
import 'package:image_search/image_search/presentation/view/home_screen.dart';
import 'package:image_search/root.dart';
import 'package:image_search/image_search/tab_bar.dart';
import 'package:image_search/user/presentation/binding/user_binding.dart';
import 'package:image_search/user/presentation/view/user_list_screen.dart';

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