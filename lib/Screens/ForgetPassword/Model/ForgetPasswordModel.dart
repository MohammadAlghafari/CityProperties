

class ForgetPasswordModel {
  List<ListForget>? listForget;

  ForgetPasswordModel({this.listForget});

  ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      listForget = <ListForget>[];
      json['name'].forEach((v) {
        listForget!.add( ListForget.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (listForget != null) {
      data['name'] = listForget!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListForget {
  String? result;

  ListForget({this.result});

  ListForget.fromJson(Map<String, dynamic> json) {
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['result'] = result;
    return data;
  }
}