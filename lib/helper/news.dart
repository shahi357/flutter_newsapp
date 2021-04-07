import 'dart:convert';
import 'package:newsapp/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];
  Future<void> getNews() async{
   String url = "https://newsapi.org/v2/top-headlines?country=nl&apiKey=8e01e1ba68a24f0abb8594bb0e0cea83";
  var response = await http.get(url);
  var jsonData = jsonDecode(response.body);
  if(jsonData['status']=="ok"){
    jsonData["articles"].forEach((element){
    if(element["urlToImage"] != null && element['description'] != null){
      ArticleModel articleModel = ArticleModel(
      title: element['title'],
      auther: element["author"],
      decription: element["description"],
      url: element["url"],
      urlToImage: element["urlToImage"],
      // publishedAt: element["publishedAt"],
      content: element["content"]
      );
     news.add(articleModel);
       }
    });
   }
  }
}

class CategoryNewsClass{
  List<ArticleModel> news = [];
  Future<void> getNews(String category) async{

  String url = "https://newsapi.org/v2/top-headlines?category=$category&country=nl&apiKey=8e01e1ba68a24f0abb8594bb0e0cea83";

  var response = await http.get(url);
  var jsonData = jsonDecode(response.body);
  if(jsonData['status']=="ok"){
    jsonData["articles"].forEach((element){
    if(element["urlToImage"] != null && element['description'] != null){
      ArticleModel articleModel = ArticleModel(
      title: element['title'],
      auther: element["author"],
      decription: element["description"],
      url: element["url"],
      urlToImage: element["urlToImage"],
      // publishedAt: element["publishedAt"],
      content: element["content"]
      );
     news.add(articleModel);
       }
    });
   }
  }
}