import 'dart:convert';

import 'package:http/http.dart';
import 'package:virtusa_assignment2/models/NewsResponse.dart';

class Network {
  final String url;
  Map<String, String> header = {
    'Content-type': 'application/json',
  };
  Network(this.url);
  // String proxyurl = "https://cors-anywhere.herokuapp.com/";

  List<Articles> news = [];

  Future<List<Articles>> getNews() async {
    final _baseUrl =
        "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=3c8323696deb4127b411617687336bbc";

    var response = await get(_baseUrl);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Articles article = Articles(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: element['publishedAt'],
            content: element["content"],
            url: element["url"],
          );
          news.add(article);
        }
      });
    }
    return news;
  }
}
