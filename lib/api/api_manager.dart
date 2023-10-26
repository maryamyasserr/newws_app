

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/models/SourceResponse.dart';

class ApiManager {
  static Future<SourceResponse?> getSources (String categoryId)async{
    /*
    https://newsapi.org/v2/top-headlines/sources?apiKey=f2f2f5b149d043cab2502484887f7fff
    */
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.sourceApi,
    {
      'apiKey' : 'f2f2f5b149d043cab2502484887f7fff',
      'category': categoryId
    }
    );
    try{
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SourceResponse.fromJson(json);
    }
    catch(e){
      throw e;
    }
  }

  static Future<NewsResponse?> getNewsBySourceId (String sourceId)async{
    /*
       https://newsapi.org/v2/everything?q=bitcoin&apiKey=f2f2f5b149d043cab2502484887f7fff
    */
    Uri url = Uri.https(ApiConstants.baseUrl , ApiConstants.newsApi,
    {
      'apiKey' : 'f2f2f5b149d043cab2502484887f7fff',
      'sources' : sourceId
    }
    );
    try{
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    }
    catch (e){
      throw e;
    }

  }
}