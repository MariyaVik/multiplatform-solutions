import 'package:http/http.dart' as http;

class WebService {
  late String url;
  Future<String> getWebBody() async {
    final response = await http.get(Uri.parse(url));
    return response.headers.toString() + '\n\n\n' + response.body;
  }

  Future<String> getWebTitle() async {
    final res = await http.get(Uri.parse(url));
    String? title = RegExp(
            r"<[t|T]{1}[i|I]{1}[t|T]{1}[l|L]{1}[e|E]{1}(\s.*)?>([^<]*)</[t|T]{1}[i|I]{1}[t|T]{1}[l|L]{1}[e|E]{1}>")
        .stringMatch(res.body);
    if (title != null) {
      return title
          .substring(title.indexOf('>') + 1, title.lastIndexOf("<"))
          .trim();
    } else {
      return "";
    }
  }

  Future<String> getWebCORS() async {
    final response = await http.get(Uri.parse(url));
    return response.headers['access-control-allow-origin'] ?? 'None';
  }
}
