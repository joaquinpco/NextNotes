import 'dart:collection';
import 'dart:js';

import 'package:http/http.dart' as http;

class Api {
  static Future<http.Response?> httpGet(Uri url) async {
    return await http.get(url);
  }

  static Future<http.Response?> httpPost(Uri url, HashMap<String, String> body) async {
    return await http.post(url, body: body);
  }
}