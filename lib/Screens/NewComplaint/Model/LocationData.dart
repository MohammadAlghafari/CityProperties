

class LocationData {
  List<ListLocation>? listLocation;

  LocationData({this.listLocation});

  LocationData.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      listLocation = <ListLocation>[];
      json['name'].forEach((v) {
        listLocation!.add( ListLocation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (listLocation != null) {
      data['name'] = listLocation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListLocation {
  String? sPOTID;
  String? pROPERTYCODE;
  String? sERVICETYPEID;
  String? sPOTDESC;

  ListLocation({this.sPOTID, this.pROPERTYCODE, this.sERVICETYPEID, this.sPOTDESC});

  ListLocation.fromJson(Map<String, dynamic> json) {
    sPOTID = json['SPOTID'];
    pROPERTYCODE = json['PROPERTYCODE'];
    sERVICETYPEID = json['SERVICETYPEID'];
    sPOTDESC = json['SPOTDESC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['SPOTID'] = sPOTID;
    data['PROPERTYCODE'] = pROPERTYCODE;
    data['SERVICETYPEID'] = sERVICETYPEID;
    data['SPOTDESC'] = sPOTDESC;
    return data;
  }
}
