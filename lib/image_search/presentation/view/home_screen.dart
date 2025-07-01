import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_search/data/data_source/pixabay_api.dart';
// import 'package:image_search/data/repository/photo_api_repository_impl.dart';
import 'package:image_search/image_search/presentation/controller/home_controller.dart';
import 'package:image_search/image_search/presentation/components/photo_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  //   @override
  //   State<HomeScreen> createState() => _HomeScreenState();
  // }

  // class _HomeScreenState extends State<HomeScreen> {
  // final _controller = TextEditingController();

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  // List<Photo> _photos = [];

  @override
  Widget build(BuildContext context) {
    // final photoProvider = PhotoProvider.of(context);
    // final viewModel = PhotoProvider.of(context).viewModel;
    // final viewModel = Provider.of<HomeViewModel>(context);
    // Consumer<HomeViewModel> 사용하면 필요 없음.
    // final viewModel = context.watch<HomeViewModel>();

    // PixbayApi 생성자 제거
    //   final viewModel = Get.put(
    // HomeController(PhotoApiRepositoryImpl(PixabayApi(http.Client())))
    // );
    // GetView로 제거
    // final viewModel = Get.put(
    //   HomeController(PhotoApiRepositoryImpl(PixabayApi())),
    // );

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Image Search App'),
      //   centerTitle: true,
        
      // ),     
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              // controller: _controller,
              // controller: viewModel.controller,
              controller: controller.controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    //
                    // // final photos = await photoProvider.api.fetch(_controller.text);
                    // photoProvider.fetch(_controller.text);
                    // viewModel.fetch(viewModel.controller.text);
                    controller.fetch(controller.controller.text);
                    // Consumer<HomeViewModel> 사용하는 경우 아래
                    // context.read<HomeViewModel>().fetch(_controller.text);
                    // // setState(() {
                    // //   _photos = photos;
                    // // });
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => GridView.builder(
                padding: const EdgeInsets.all(16),
                // shrinkWrap: true, // 영역 확보
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                //
                // itemCount: viewModel.photos.length,
                itemCount: controller.photos.length,
                itemBuilder: (context, index) {
                  //
                  // final photo = viewModel.photos[index];
                  final photo = controller.photos[index];
                  return PhotoWidget(
                    photo: photo,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
