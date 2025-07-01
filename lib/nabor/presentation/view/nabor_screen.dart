import 'package:flutter/material.dart';

class NaborScreen extends StatelessWidget {
  const NaborScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('이웃 Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: const Text('이웃 페이지'),
      ),
    );
  }
}