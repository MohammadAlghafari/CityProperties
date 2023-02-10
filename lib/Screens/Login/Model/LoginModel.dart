


class LoginModel {
  List<ListLogin>? listLogin;

  LoginModel({this.listLogin});

  LoginModel.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      listLogin = <ListLogin>[];
      json['name'].forEach((v) {
        listLogin!.add( ListLogin.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (listLogin != null) {
      data['name'] = listLogin!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListLogin {
  String? result;
  String? tenantcode;
  String? pidno;

  ListLogin({this.result, this.tenantcode, this.pidno});

  ListLogin.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    tenantcode = json['tenantcode'];
    pidno = json['pidno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['result'] = result;
    data['tenantcode'] = tenantcode;
    data['pidno'] = pidno;
    return data;
  }
}
