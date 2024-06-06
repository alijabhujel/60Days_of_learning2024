import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_state_manage/model/post_model.dart';
import 'package:http/http.dart' as http;

class Postrepository {
  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if (response.statusCode == 200) {
        final body = jsonDecode('').decode(response.body) as List;
        return body.map((e) {
          return PostModel(
              postId: e['postId'] as int,
              email: e['title'] as String,
              body: e['body'] as String);
        }).toList();
      }
    } on SocketException {
      throw Exception('error while fetching data');
    } on TimeoutException {
      throw Exception('error while fetching data');
    }
    throw Exception('error while fetching data');
  }
}
