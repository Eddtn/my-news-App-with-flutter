// https://newsapi.org/v2/everything?q=Apple&from=2022-06-28&sortBy=popularity&apiKey=d101e92983a046f0a67d81497a57d84b

import 'dart:convert';

import '../models/model.dart';
import 'package:http/http.dart' as http;

class NewsService {
  Future<List<Article>> getnews() async {
    try {
      http.Response response;
      await http.get(
        Uri.parse(
          'https://newsapi.org/v2/everything?q=Apple&from=2022-06-28&sortBy=popularity&apiKey=d101e92983a046f0a67d81497a57d84b',
        ),
      );
      print('object people');
      return getnews();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
