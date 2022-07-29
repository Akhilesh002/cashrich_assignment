import 'dart:convert';

import 'package:cashrich/base/constant.dart';

import '../model/response_model.dart';

import 'package:http/http.dart' as http;

class RestApiClient {
  static RestApiClient shared = RestApiClient._internal();

  RestApiClient._internal();

  Future<ResponseModel> getData() async {
    final url = Uri.parse(Constant.API_URL);
    final response =
        await http.get(url, headers: {Constant.AUTH_KEY: Constant.AUTH_VALUE});

    if (response == null || response.body == null) {
      return ResponseModel.fromJson({});
    }

    return ResponseModel.fromJson(jsonDecode(response.body));
  }
}
