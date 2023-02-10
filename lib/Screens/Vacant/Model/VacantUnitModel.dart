

class VacantUnitModel {
  List<ListVacantUnit>? listVacantUnit;

  VacantUnitModel({this.listVacantUnit});

  VacantUnitModel.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      listVacantUnit = <ListVacantUnit>[];
      json['name'].forEach((v) {
        listVacantUnit!.add( ListVacantUnit.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (listVacantUnit != null) {
      data['name'] = listVacantUnit!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListVacantUnit {
  String? dEVNAME;
  String? dEVNAMEAR;
  String? pROPERTYCODE;
  String? eXPECTEDPRICE;
  String? dEVCODE;
  String? pROPERTYNAME;
  String? sHORTCODE;

  ListVacantUnit(
      {this.dEVNAME,
        this.dEVNAMEAR,
        this.pROPERTYCODE,
        this.eXPECTEDPRICE,
        this.dEVCODE,
        this.pROPERTYNAME,
        this.sHORTCODE});

  ListVacantUnit.fromJson(Map<String, dynamic> json) {
    dEVNAME = json['DEVNAME'];
    dEVNAMEAR = json['DEVNAME_AR'];
    pROPERTYCODE = json['PROPERTYCODE'];
    eXPECTEDPRICE = json['EXPECTEDPRICE'];
    dEVCODE = json['DEVCODE'];
    pROPERTYNAME = json['PROPERTYNAME'];
    sHORTCODE = json['SHORTCODE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['DEVNAME'] = dEVNAME;
    data['DEVNAME_AR'] = dEVNAMEAR;
    data['PROPERTYCODE'] = pROPERTYCODE;
    data['EXPECTEDPRICE'] = eXPECTEDPRICE;
    data['DEVCODE'] = dEVCODE;
    data['PROPERTYNAME'] = pROPERTYNAME;
    data['SHORTCODE'] = sHORTCODE;
    return data;
  }
}
