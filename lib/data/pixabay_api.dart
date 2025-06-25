import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi implements PhotoApiRepository{

static final apiKey = dotenv.env['API_KEY'] ?? '';
static const baseUrl = 'https://pixabay.com';
  @override
  Future<List<Photo>> fetch(String query, {http.Client? client}) async {
    
    client ??= http.Client();
    
    final response = await client.get(
      Uri.parse(
        '$baseUrl/api/?key=$apiKey&q=$query&image_type=photo&pretty=true'
      ),
    );

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
  Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}