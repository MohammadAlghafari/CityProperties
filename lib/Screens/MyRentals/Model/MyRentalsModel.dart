class MyRentalsModel {
  List<ListMyRentals>? listMyRentals;

  MyRentalsModel({this.listMyRentals});

  MyRentalsModel.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      listMyRentals = <ListMyRentals>[];
      json['name'].forEach((v) {
        listMyRentals!.add( ListMyRentals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (listMyRentals != null) {
      data['name'] = listMyRentals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListMyRentals {
  String? dEVNAME;
  String? dEVNAMEAR;
  String? sHORTCODE;
  String? pROPERTYNAME;
  String? sTATUSNAME;
  String? pROPERTYCODE;
  String? iNTCONTRACTNO;
  String? dEVCODE;

  ListMyRentals(
      {dEVNAME,
        dEVNAMEAR,
        sHORTCODE,
        pROPERTYNAME,
        sTATUSNAME,
        pROPERTYCODE,
        iNTCONTRACTNO,
        dEVCODE});

  ListMyRentals.fromJson(Map<String, dynamic> json) {
    dEVNAME = json['DEVNAME'];
    dEVNAMEAR = json['DEVNAME_AR'];
    sHORTCODE = json['SHORTCODE'];
    pROPERTYNAME = json['PROPERTYNAME'];
    sTATUSNAME = json['STATUSNAME'];
    pROPERTYCODE = json['PROPERTYCODE'];
    iNTCONTRACTNO = json['INTCONTRACTNO'];
    dEVCODE = json['DEVCODE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['DEVNAME'] = dEVNAME;
    data['DEVNAME_AR'] = dEVNAMEAR;
    data['SHORTCODE'] = sHORTCODE;
    data['PROPERTYNAME'] = pROPERTYNAME;
    data['STATUSNAME'] = sTATUSNAME;
    data['PROPERTYCODE'] = pROPERTYCODE;
    data['INTCONTRACTNO'] = iNTCONTRACTNO;
    data['DEVCODE'] = dEVCODE;
    return data;
  }
}
