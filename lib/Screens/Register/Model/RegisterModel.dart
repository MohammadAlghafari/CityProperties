

class RegisterModel {
  List<ListRegister>? listRegister;

  RegisterModel({this.listRegister});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      listRegister = <ListRegister>[];
      json['name'].forEach((v) {
        listRegister!.add( ListRegister.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (listRegister != null) {
      data['name'] = listRegister!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListRegister {
  String? result;

  ListRegister({this.result});

  ListRegister.fromJson(Map<String, dynamic> json) {
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['result'] = result;
    return data;
  }
}