import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('나의 Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: const Text('나의 페이지'),
      ),
    );
  }
}