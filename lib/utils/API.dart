import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "http://chroniques.sn";

class API {
  static Future fetchData() {
    var url = baseUrl + "/wp-json/wp/v2/posts?_embed";
    // return http.get(url,headers: {"Accept": "application/json"});
    return http.get(url);
  }
}
