// https://newsapi.org/v2/everything?q=Apple&from=2022-06-28&sortBy=popularity&apiKey=d101e92983a046f0a67d81497a57d84b

import 'dart:convert';

import '../models/model.dart';
import 'package:http/http.dart' as http;

class NewsService {
  Future<List<Article>> getnews() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          'https://newsapi.org/v2/everything?q=Apple&from=2022-06-28&sortBy=popularity&apiKey=d101e92983a046f0a67d81497a57d84b',
        ),
      );
      print('object people');
      // print(response.body);
      final data = jsonDecode(response.body);
      return (data as List)
          .map<Article>(
              (element) => Article.fromJson(element as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
