import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';

import 'package:http/http.dart' as http;


final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = '43e1e61f8c554f14a732770197d62da2';


class NewsService with ChangeNotifier{

  List<Article> headLines = [];
  String _selectedCategory = 'bussines';

  List<Category> categories = [
    Category( FontAwesomeIcons.building, 'business' ),
    Category( FontAwesomeIcons.tv, 'entertainment' ),
    Category( FontAwesomeIcons.addressCard, 'general' ),
    Category( FontAwesomeIcons.headSideVirus, 'health' ),
    Category( FontAwesomeIcons.vials, 'science' ),
    Category( FontAwesomeIcons.volleyballBall, 'sports' ),
    Category( FontAwesomeIcons.memory, 'technology' ),

  ];

  Map<String, List<Article>> categoryArticles = {

  };


  NewsService(){
    this.getTopHeadLines();


    categories.forEach((item) { 
      this.categoryArticles[item.name] = [];
    });

  }

  get selectedCategory => this._selectedCategory;

  set selectedCategory( String valor ){
    this._selectedCategory = valor;
    
    this.getArticlesByCategory(valor);
    notifyListeners();
  }

  List<Article> get getArticulosCategoriaSeleccionada => this.categoryArticles[this.selectedCategory]; 
  

  getTopHeadLines() async {
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=mx';
    final resp = await http.get( Uri.parse(url) );
    final newsResponse = newsResponseFromJson(resp.body);
    this.headLines.addAll( newsResponse.articles );
    notifyListeners();
  }

  getArticlesByCategory( String category ) async {
    if( this.categoryArticles[category].length > 0){
      return this.categoryArticles[category];
    }
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=mx&category=$category';
    final resp = await http.get( Uri.parse(url) );
    final newsResponse = newsResponseFromJson(resp.body);

    this.categoryArticles[category].addAll(newsResponse.articles);

    notifyListeners();
  }

}