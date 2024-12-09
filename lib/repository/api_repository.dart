import 'package:flut_api/data/AppUrl.dart';
import 'package:flut_api/data/network/base_api_services.dart';
import 'package:flut_api/data/network/network_api_services.dart';
import 'package:flutter/foundation.dart';
import '../model/login/login_resp.dart';

class ApiRepository {
  final BaseApiServices _baseApiServices = NetworkApiServices();

  Future<LoginResp> callPostApi(dynamic data) async {
    dynamic response = await _baseApiServices.postApiResponse(AppUrl.listUrl, data);

   /*response.then((value) =>
       print("callPostApi2$value")
   );*/

    LoginResp loginResp = await LoginResp.fromJson(response);
      if (kDebugMode) {
      print("callPostApi$loginResp");
    }

      return loginResp;

  }
}
