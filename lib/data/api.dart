import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_search/model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi {

static final apiKey = dotenv.env['API_KEY'] ?? '';
static final baseUrl = 'https://pixabay.com';
  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl/api/?key=$apiKey&q=$query&image_type=photo&pretty=true'
      ),
    );

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
  Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}