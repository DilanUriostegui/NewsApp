import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';

import 'package:http/http.dart' as http;


final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = '43e1e61f8c554f14a732770197d62da2';


class NewsService with ChangeNotifier{


  List<Article> headLines = [];
  NewsService(){
    this.getTopHeadLines();
  }

  getTopHeadLines() async {

    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=mx';
    final resp = await http.get( Uri.parse(url) );

    final newsResponse = newsResponseFromJson(resp.body);

    this.headLines.addAll( newsResponse.articles );

    notifyListeners();
    

  }
}