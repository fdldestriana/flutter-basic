import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStateful {
  String? id = null, name = null, job = null, createdAt = null;

  HttpStateful({this.id, this.name, this.job, this.createdAt});

  static Future<HttpStateful> connectApi(String name, String job) async {
    Uri url = Uri.parse('https://reqres.in/api/users');
    var data = await http.post(url, body: {"name": name, "job": job});

    var jsonData = json.decode(data.body);
    return HttpStateful(
        id: jsonData['id'],
        name: jsonData['name'],
        job: jsonData['job'],
        createdAt: jsonData['createdAt']);
  }
}
