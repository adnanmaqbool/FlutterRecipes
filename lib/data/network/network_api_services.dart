import 'dart:convert';
import 'dart:io';
import 'package:flut_api/data/AppUrl.dart';
import 'package:flut_api/data/network/base_api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../exceptions/app_exceptions.dart';
import 'package:flut_api/constants/AppConst.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: AppConst.apiTimeOut));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException(AppConst.noInternetError);
    }

    return responseJson;
  }

  @override
  Future postApiResponse(url, postData) async {
    dynamic responseJson;
    try {
      var response = await post(Uri.parse(url), body: postData)
          .timeout(Duration(seconds: AppConst.apiTimeOut));
      if (kDebugMode) {
        print("postApiResponse$response");
      }
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException(AppConst.noInternetError);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        if (kDebugMode) {
          print("returnResponse$responseJson");
        }
        return responseJson;
      case 400:
        throw BadRequestException(AppConst.apiNotFound);
      case 500:
        throw UnAuthorizedException(AppConst.unAuthorized);
    }
  }
}
