

class ServiceTypeModel {
  List<ListServiceType>? listServiceType;

  ServiceTypeModel({this.listServiceType});

  ServiceTypeModel.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      listServiceType = <ListServiceType>[];
      json['name'].forEach((v) {
        listServiceType!.add( ListServiceType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (listServiceType != null) {
      data['name'] = listServiceType!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListServiceType {
  String? sERVICETYPEID;
  String? sERVICETYPENAME;

  ListServiceType({this.sERVICETYPEID, this.sERVICETYPENAME});

  ListServiceType.fromJson(Map<String, dynamic> json) {
    sERVICETYPEID = json['SERVICETYPEID'];
    sERVICETYPENAME = json['SERVICETYPENAME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['SERVICETYPEID'] = sERVICETYPEID;
    data['SERVICETYPENAME'] = sERVICETYPENAME;
    return data;
  }
}
