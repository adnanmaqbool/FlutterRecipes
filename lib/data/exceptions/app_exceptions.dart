import 'package:flut_api/constants/AppConst.dart';
import 'package:flutter/foundation.dart';

class AppException implements Exception {
  final String? _message;
  final String? _preFixMessage;

  AppException([this._message, this._preFixMessage]);

  @override
  String toString() {
    if (kDebugMode) {
      print("$_preFixMessage$_message");
      return "$_preFixMessage$_message";
    }
    return super.toString();
  }
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message, AppConst.preBadRequest);
}

class NoInternetException extends AppException {
  NoInternetException([String? message])
      : super(message, AppConst.preNoInternetException);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message])
      : super(message, AppConst.preUnauthorized);
}
