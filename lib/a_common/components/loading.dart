import 'package:flutter/material.dart';
import 'package:image_search/a_common/components/app_font.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Column(
        children: [
          CircularProgressIndicator(strokeWidth: 1),
          SizedBox(height: 20),
          AppFont(
              '로딩 중...',
          color: Colors.white,
          size: 18,),
        ],
      ),
    );

  }
}
