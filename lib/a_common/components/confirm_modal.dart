import 'package:flutter/material.dart';

class ConfirmModal extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback cancel;
  final VoidCallback confirmAction;
  final String confirmText;

  const ConfirmModal({
    super.key,
    required this.title,
    required this.message,
    required this.cancel,
    required this.confirmAction,
    required this.confirmText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: cancel,
          child: const Text('취소'),
        ),
        TextButton(
          onPressed: confirmAction,
          child: Text(confirmText),
        ),
      ],
    );
  }
}
