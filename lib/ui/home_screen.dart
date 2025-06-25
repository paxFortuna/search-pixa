import 'package:flutter/material.dart';
import 'package:image_search/data/photo_provider.dart';
import 'package:image_search/model/photo.dart';
import 'package:image_search/ui/home_view_model.dart';
import 'package:image_search/ui/widget/photo_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // List<Photo> _photos = [];
  
  @override
  Widget build(BuildContext context) {

    // final photoProvider = PhotoProvider.of(context);
    // final viewModel = PhotoProvider.of(context).viewModel;
final viewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Image Search App'), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    //
                    // // final photos = await photoProvider.api.fetch(_controller.text);
                    // photoProvider.fetch(_controller.text);
                    viewModel.fetch(_controller.text);
                    // // setState(() {
                    // //   _photos = photos;
                    // // });
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          StreamBuilder<List<Photo>>(
            // stream: photoProvider.photoStream,
            stream: viewModel.photoStream,
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }

              final photos = snapshot.data!;
              return Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  // shrinkWrap: true, // 영역 확보
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: photos.length,
                  itemBuilder: (context, index) {
                    //
                    final photo = photos[index];
                    return PhotoWidget(
                      photo: photo,);
                  },
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
