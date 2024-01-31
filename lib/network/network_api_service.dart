
import 'dart:convert';
import 'dart:io';

import 'package:practice_dart/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService implements BaseApiService {

  @override
  Future<dynamic> getResponse(Uri uri) async {
    try {
      final response = await http.get(
        uri
      );
      return  returnResponse(response);
    } on SocketException {
      return FetchDataException('No Internet Connection');
    }
  }
}

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      return jsonDecode(response.body);
    case 400:
      throw BadRequestException(response.body.toString());
    case 404:
      throw BadRequestException(response.body.toString());
    case 500:
      throw BadRequestException(response.body.toString());
    default:
      throw FetchDataException("Error occurred while communicating with server with status code ${response.statusCode}");
  }
}

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message,this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}
class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, "Error During Communication");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Invalid Request");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) : super(message, "Unauthorised Request");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Unauthorised Input");
}