class ChangePasswordModel {
  List<ListChangePassword>? listChangePassword;

  ChangePasswordModel({this.listChangePassword});

  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      listChangePassword = <ListChangePassword>[];
      json['name'].forEach((v) {
        listChangePassword!.add( ListChangePassword.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (listChangePassword != null) {
      data['name'] = listChangePassword!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListChangePassword {
  String? result;

  ListChangePassword({this.result});

  ListChangePassword.fromJson(Map<String, dynamic> json) {
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['result'] = result;
    return data;
  }
}
