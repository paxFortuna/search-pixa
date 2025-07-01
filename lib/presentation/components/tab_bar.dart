import 'package:flutter/material.dart';
import 'package:image_search/presentation/home/home_screen.dart';

class TabBarWidget {
  final List<Tab> myTaps = [
    Tab(icon: Icon(Icons.home), text: '홈'),
    Tab(icon: Icon(Icons.feed), text: '동네'),
    Tab(icon: Icon(Icons.chat_bubble_outline_rounded), text: '채팅'),
    Tab(icon: Icon(Icons.person_2_outlined), text: '마이'),
  ];

  final List<Widget> myTabItems=[
    const HomeScreen(),
    Center(child: Text('동네'),),
    Center(child: Text('채팅'),),
    Center(child: Text('마이'),),
  ];
}