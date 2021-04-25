import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:medium_http_request/Utilities/LoadingPage.dart';
import 'package:medium_http_request/Utilities/MyException.dart';

class RemoteApiService {
  static const _baseUrl = "reqres.in";

  static void _checkResponse(BuildContext context, Response response) {
    if (response.statusCode != 200) {
      throw MyException("BadRequest");
    }
  }

  static Future<Response> post(BuildContext context, String uri, Object request, {Map<String, String> headers, bool showLoadingPage = true}) async {
    try {
      if (showLoadingPage) LoadingPage.show(context);

      Map<String, String> requestHeader = {
        "Content-Type": "application/json",
      };
      if (headers != null) requestHeader.addAll(headers);

      var response = await http.post(Uri.https(_baseUrl, uri), body: json.encode(request ?? ""), headers: requestHeader);

      _checkResponse(context, response);

      if (showLoadingPage) Navigator.of(context, rootNavigator: true).pop();

      return response;
    } catch (e) {
      if (showLoadingPage) Navigator.of(context, rootNavigator: true).pop();
      throw e;
    }
  }
}
