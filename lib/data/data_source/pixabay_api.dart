import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  final http.Client client;
  PixabayApi(this.client);

  static final apiKey = dotenv.env['API_KEY'] ?? '';
  static const baseUrl = 'https://pixabay.com';

  Future<List<Map<String, dynamic>>> fetch(String query) async {
    final response = await client.get(
      Uri.parse(
        '$baseUrl/api/?key=$apiKey&q=$query&image_type=photo&pretty=true'
      ),
    );
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    List<Map<String, dynamic>> hits = List<Map<String, dynamic>>.from(jsonResponse['hits']);

    return hits;
  }
}
