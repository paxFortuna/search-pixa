import 'package:flutter/widgets.dart';
import 'package:image_search/ui/home_view_model.dart';

class PhotoProvider extends InheritedWidget {
  // 인스턴스 생성하여 main에서 주입한다.
  // final PixabayApi api;
  // Stream
  // final _photoScreamController = StreamController<List<Photo>>()..add([]);
  // Stream<List<Photo>> get photoStream => _photoScreamController.stream;
  final HomeViewModel viewModel;
  const PhotoProvider( {
    super.key, 
    required this.viewModel,
    required super.child, 
    // required this.api,
  });
  
  // InheritecWidget 문서에 있는 코드임, of함수를 통해 접금
  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result = 
    context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    // result가 null이 아니면 진행, 널이면 뒤의 에러 메시지 보여준다.
    assert(result !=null, 'No PixabayApi found in context');
    return result!;
  }

  // Future<void> fetch(String query) async {
  //   final result = await api.fetch(query);
  //   _photoScreamController.add(result);
  // }
  
  @override
  // 위의 위젯이 변경되면 알려주는 것
  bool updateShouldNotify(PhotoProvider oldWidget) {
    // return oldWidget.api != api;
    return true;
  }
}