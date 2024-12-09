import 'package:flut_api/model/login/login_resp.dart';
import 'package:flut_api/repository/api_repository.dart';
import 'package:flutter/foundation.dart';

import '../utils/Utils.dart';

class ApiViewModel extends ChangeNotifier {
  final _apiRepository = ApiRepository();

  bool loading = false;

  LoginResp? loginResp;

  bool getLoading() {
    return loading;
  }

  setLoading(bool isLoading) {
    loading = isLoading;
    notifyListeners();
  }

  setLoginResponse(LoginResp loginResp) {
    this.loginResp = loginResp;
    notifyListeners();
  }

  LoginResp? getLoginResp() {
    return loginResp;
  }

  Future<void>? apiResponses(dynamic data) {
    setLoading(true);

    _apiRepository.callPostApi(data).then((value) {
      setLoginResponse(value);

      Utils.showToast(value.toString());

      setLoading(false);
      if (kDebugMode) {
        print("apiResponses$value");
      }
    }).onError((error, stackTrace) {
      Utils.showToast(error.toString());
      setLoading(false);
      if (kDebugMode) {
        print("MyError$error$stackTrace");
      }
    });
  }
}
