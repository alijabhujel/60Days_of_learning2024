import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:bloc_state_manage/config/exceptions/exception.dart';
import 'package:bloc_state_manage/config/network/base_apiservices.dart';

class NetworkServicesApi implements BaseApiServices {
  @override
  Future<dynamic> deleteApi(String url) async {
    try {
      final response =
          await http.delete(Uri.parse(url)).timeout(Duration(seconds: 5));
      if (response.statusCode == 200) {}
    } on SocketException {
      throw NointernetException();
    } on TimeoutException {
      throw NointernetException();
    }
  }

  @override
  Future<dynamic> getApi(String url) async {
    // Implement the getApi method
  }

  @override
  Future<dynamic> postApi(String url, data) async {
    // Implement the postApi method
  }

  dynamic returnResponse(http.Response response) {
    switch (response) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
    }
  }
}
