import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/photo_api_repository.dart';
// import 'package:image_search/data/pixabay_api.dart';
import 'package:image_search/model/photo.dart';
import 'package:image_search/ui/home_view_model.dart';

void main(){
  test('Stream이 잘 동작해야 한다.', () async{
    final viewModel = HomeViewModel(FakePhotoApiRepository());
    
    await viewModel.fetch('apple');
    await viewModel.fetch('iphone');

    final result = fakeJson.map((e)=>Photo.fromJson(e)).toList();

    expect(
      viewModel.photoStream, 
      emitsInOrder([
        // type test
        // isA<List<Photo>>(),
        // isA<List<Photo>>(),
        equals([]),
        equals(result),
        equals(result),
      ]));

  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<List<Photo>> fetch(String query) async{
    Future.delayed(const Duration(microseconds: 500));
    return fakeJson.map((e)=>Photo.fromJson(e)).toList();
  }

}

List<Map<String, dynamic>> fakeJson =[
{
      "id": 1702316,
      "pageURL": "https://pixabay.com/photos/apple-red-fruit-red-chief-1702316/",
      "type": "photo",
      "tags": "apple, red, fruit, red chief, red apple, fresh apple, ripe, ripe apple, fresh, fresh fruit, harvest, produce, organic, healthy, food, close up, apple, apple, apple, apple, apple",
      "previewURL": "https://cdn.pixabay.com/photo/2016/09/29/08/33/apple-1702316_150.jpg",
      "previewWidth": 150,
      "previewHeight": 116,
      "webformatURL": "https://pixabay.com/get/g97fddda81d2919a67b0a1d643154437a3294a449933febee8c9ed8fc7da263636b868faea8def91014ab2c53d7b636fe21d724fba40cf2db76f63fc8c39b3086_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 495,
      "largeImageURL": "https://pixabay.com/get/g24869dcde8ba590927f1826164c25bd8a4660a214c8778e17756074ec2f60573ab63635b5028e1c1b27f81119bcb35ff0ae70c589bd1c569c5e21daff9616440_1280.jpg",
      "imageWidth": 4000,
      "imageHeight": 3099,
      "imageSize": 1930833,
      "views": 186808,
      "downloads": 127532,
      "collections": 387,
      "likes": 392,
      "comments": 35,
      "user_id": 2364555,
      "user": "NoName_13",
      "userImageURL": "https://cdn.pixabay.com/user/2022/12/12/07-40-59-226_250x250.jpg",
      "noAiTraining": false
    },
    {
      "id": 1702316,
      "pageURL": "https://pixabay.com/photos/apple-red-fruit-red-chief-1702316/",
      "type": "photo",
      "tags": "apple, red, fruit, red chief, red apple, fresh apple, ripe, ripe apple, fresh, fresh fruit, harvest, produce, organic, healthy, food, close up, apple, apple, apple, apple, apple",
      "previewURL": "https://cdn.pixabay.com/photo/2016/09/29/08/33/apple-1702316_150.jpg",
      "previewWidth": 150,
      "previewHeight": 116,
      "webformatURL": "https://pixabay.com/get/g97fddda81d2919a67b0a1d643154437a3294a449933febee8c9ed8fc7da263636b868faea8def91014ab2c53d7b636fe21d724fba40cf2db76f63fc8c39b3086_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 495,
      "largeImageURL": "https://pixabay.com/get/g24869dcde8ba590927f1826164c25bd8a4660a214c8778e17756074ec2f60573ab63635b5028e1c1b27f81119bcb35ff0ae70c589bd1c569c5e21daff9616440_1280.jpg",
      "imageWidth": 4000,
      "imageHeight": 3099,
      "imageSize": 1930833,
      "views": 186808,
      "downloads": 127532,
      "collections": 387,
      "likes": 392,
      "comments": 35,
      "user_id": 2364555,
      "user": "NoName_13",
      "userImageURL": "https://cdn.pixabay.com/user/2022/12/12/07-40-59-226_250x250.jpg",
      "noAiTraining": false
    }
];
