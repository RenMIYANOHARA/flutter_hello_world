import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiHelper {
  Future<http.Response> apiRequest(
      String method,
      String path,
      dynamic queryParams,
      dynamic body,
      ) async {
    try {
      final http.Response response = await generateRequest(
        method,
        path,
        queryParams,
        body,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future generateRequest(
      String method,
      String path,
      dynamic queryParams,
      dynamic body,
      ) async {
    switch (method.toLowerCase()) {
      case 'post':
        http.Response? response;

        try {
          response = await http.post(
            Uri.parse(path),
            headers: {
              'x-api-key': 'U6LQyXN3jl7v14oVtledL84Hv4qA4Aix7gxP8Nj4',
            },
            body: json.encode(body),
          );
        } catch (e) {
          print(e);
        }
        return response;
        break;
      default:
        break;
    }
  }
}