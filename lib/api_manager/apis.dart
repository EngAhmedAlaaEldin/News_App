import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/NewsResponce.dart';
import '../models/SourceResponce.dart';

class Api_Manage {
  static const String baseUrl = 'newsapi.org';
  static const String api_key = '07236d2597114254bc776b07071017e5';

  static Future<SourceResponse> getSourceData(String category) async {
    var uri =
        Uri.https(baseUrl, '/v2/top-headlines/sources', {'apiKey': api_key,
        'category' : category
        });
    var response = await http.get(uri);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var responseBody = SourceResponse.fromJson(json);
      return responseBody;
  }

  static Future<NewsResponce> getNewsData({String? sourceId ,String? query})async{
    var uri =
    Uri.https(baseUrl, '/v2/everything', {
      'apiKey': api_key,
      'sources': sourceId,
      'q' : query
    });
    var response = await http.get(uri);
    var bodyString = response.body;
    var json = jsonDecode(bodyString);
    var responseData = NewsResponce.fromJson(json);
    return responseData;
  }
}
