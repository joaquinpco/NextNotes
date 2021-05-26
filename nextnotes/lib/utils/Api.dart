import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

class Api {
  static Future<http.Response?> httpGet(Uri url) async {
    return await http.get(url);
  }

  static Future<http.Response?> httpPost(Uri url, String body) async {
    return await http.post(url, body: body);
  }

  static Future<http.Response?> httpDelete(Uri url) async {
    String urlWithParams = url.toString();
    return await http.delete(Uri.parse(urlWithParams),);
  }

  static Future<http.Response?> httpPut(Uri url, String body) async { 
    return await http.put(url, body: body);
  }

  Uri getUri(String path, { Map<String, dynamic>? params}) {
    return params == null ? Uri.http(
      "${DotEnv.env['HOST']}:${DotEnv.env['PORT']}", 
      path
    ) :
    Uri.http(
      "${DotEnv.env['HOST']}:${DotEnv.env['PORT']}", 
      path,
      params
    );
  }
}