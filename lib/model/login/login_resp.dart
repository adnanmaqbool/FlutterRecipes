/*class LoginResp {
  String? token;

  LoginResp({this.token});

   LoginResp.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}*/
class LoginResp {
  LoginResp({
    this.token,});

  LoginResp.fromJson(dynamic json) {
    token = json['token'];
  }
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    return map;
  }

}
