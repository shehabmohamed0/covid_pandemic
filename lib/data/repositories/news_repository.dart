import 'package:covid_pandemic/data/models/news.dart';
import 'package:covid_pandemic/data/web_services/news_services.dart';
import 'package:flutter/foundation.dart';

class NewsRepository {
  NewsServices newsServices = NewsServices();
  Future<List<Article>> getNewsByCategory(String category) async {
    Map<String, dynamic> response =
        await newsServices.fetchNewsByCategory(category);
    return compute(parseArticles, response);
  }
}

List<Article> parseArticles(Map<String, dynamic> map) {
  return News.fromJson(map).articles;
}
