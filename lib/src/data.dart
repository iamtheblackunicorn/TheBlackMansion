/*
The Black Mansion App by Alexander Abraham.
Licensed under the MIT license.
*/

import 'vars.dart';
import 'package:dio/dio.dart';

/// This class handles the retrieveing
/// of the API's data and returns it
/// as a [Future<String>].
class APIStorage {
  Future<String> fetchData() async {
    try {
      Response response = await dio.get(
        apiUrl,
        options: Options(
          responseType: ResponseType.json,
          followRedirects: true,
          validateStatus: (status) { return status < 500; }
        ),
      );
      return response.data;
    } catch (e) {
      Response response = await dio.get(
        apiUrl,
        options: Options(
          responseType: ResponseType.json,
          followRedirects: true,
          validateStatus: (status) { return status < 500; }
        ),
      );
      return response.data;
    }
  }
  Future<String> readData() async {
    Future<String> data = fetchData();
    return data;
  }
}
