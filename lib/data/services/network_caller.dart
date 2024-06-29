import 'package:http/http.dart' as http;
import 'package:superio_assignment/data/utils/urls.dart';


class NetworkCaller {
  static Future<String> get() async {
    final url = Uri.parse(
      '${Urls.baseUrl}');
    final response = await http.get(url, headers: Urls.requestHeader);
    if(response.statusCode == 200){
      return response.body;
    }
    return "";
  }
}