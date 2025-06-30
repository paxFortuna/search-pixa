import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:http/http.dart' as http;
import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/data/repository/photo_api_repository_impl.dart';
import 'package:image_search/presentation/home/initial_binding.dart';
import 'package:image_search/presentation/home/home_screen.dart';
import 'package:image_search/presentation/home/home_controller.dart';
import 'package:provider/provider.dart';

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
      getPages: [
        GetPage(name: '/', page: ()=> const HomeScreen()),
      ],
    );
  }
}
