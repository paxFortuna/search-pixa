import 'package:flutter/material.dart';
import 'package:image_search/a_common/components/confirm_modal.dart';

class BottomModalSheet extends StatelessWidget {
  final VoidCallback cancelTap;
  final VoidCallback hideTap;
  final VoidCallback? delete;
  const BottomModalSheet({
    super.key,
    required this.cancelTap,
    required this.hideTap,
    this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.visibility_off_outlined),
                  title: Text('이 글 숨기기'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return ConfirmModal(
                          title: '글 숨기기',
                          message: '이 글을 숨기시겠습내까? 숨긴 글은 다시 볼 수 없습니다.',
                          cancel: () {
                            Navigator.pop(context);
                          },
                          confirmAction: () {
                            // 파라미터 함수 실행
                            hideTap();
                            // BottomModal 제거
                            Navigator.pop(context);
                            // ConfirmModal 제거
                            Navigator.pop(context);
                          },
                          confirmText: '숨기기',
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help_outline),
                  title: Text('게시글 노출 기준'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.warning_amber_outlined,
                    color: Colors.red,
                  ),
                  title: Text('신고하기'),
                  textColor: Colors.red,
                ),
                Visibility(
                  visible: delete != null,
                  child: ListTile(
                    leading: const Icon(Icons.delete_outline),
                    title: const Text('삭제하기'),
                    onTap: delete,
                ))
              ],
            ),
          ),
          //
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: const Text(
                '닫기',
                textAlign: TextAlign.center,
              ),
              onTap: cancelTap,
            ),
          ),
        ],
      ),
    );
  }
}
