class MyRentalsDetailsModel {
  String? cNTNAME;
  String? cITYNAME;
  String? aREANAME;
  String? tENANTNAME;
  String? mOBILE;
  String? cONTRACTNO;
  String? dEVNAME;
  String? dEVNAMEAR;
  String? sHORTCODE;
  String? pROPERTYNAME;
  String? tRANSRENT;
  String? cONSTARTDT;
  String? cONENDDT;
  String? sTATUSNAME;
  String? cONTTYPE;
  String? mUNCONTNO;
  String? iNTCONTRACTNO;
  String? dEVCODE;
  String? pROPERTYNAMEAR;
  String? cOMPLAINREGISTRATIONIMAGE;
  List<ContractImages>? contractImages;
  List<CarParking>? carParking;
  MyRentalsDetailsModel(
      {this.cNTNAME,
        this.cITYNAME,
        this.aREANAME,
        this.tENANTNAME,
        this.mOBILE,
        this.cONTRACTNO,
        this.dEVNAME,
        this.dEVNAMEAR,
        this.sHORTCODE,
        this.pROPERTYNAME,
        this.tRANSRENT,
        this.cONSTARTDT,
        this.cONENDDT,
        this.sTATUSNAME,
        this.cONTTYPE,
        this.mUNCONTNO,
        this.iNTCONTRACTNO,
        this.dEVCODE,
        this.pROPERTYNAMEAR,
        this.cOMPLAINREGISTRATIONIMAGE,
        this.contractImages,
        this.carParking
      });

  MyRentalsDetailsModel.fromJson(Map<String, dynamic> json) {
    cNTNAME = json['CNT_NAME'];
    cITYNAME = json['CITYNAME'];
    aREANAME = json['AREANAME'];
    tENANTNAME = json['TENANTNAME'];
    mOBILE = json['MOBILE'];
    cONTRACTNO = json['CONTRACTNO'];
    dEVNAME = json['DEVNAME'];
    dEVNAMEAR = json['DEVNAME_AR'];
    sHORTCODE = json['SHORTCODE'];
    pROPERTYNAME = json['PROPERTYNAME'];
    tRANSRENT = json['TRANSRENT'];
    cONSTARTDT = json['CONSTARTDT'];
    cONENDDT = json['CONENDDT'];
    sTATUSNAME = json['STATUSNAME'];
    cONTTYPE = json['CONT_TYPE'];
    mUNCONTNO = json['MUN_CONTNO'];
    iNTCONTRACTNO = json['INTCONTRACTNO'];
    dEVCODE = json['DEVCODE'];
    pROPERTYNAMEAR = json['PROPERTYNAME_AR'];
    cOMPLAINREGISTRATIONIMAGE = json['COMPLAINREGISTRATION_IMAGE'];
    if (json['carParking'] != null) {
      carParking = <CarParking>[];
      json['carParking'].forEach((v) {
        carParking!.add( CarParking.fromJson(v));
      });
    }
    if (json['contractImages'] != null) {
      contractImages = <ContractImages>[];
      json['contractImages'].forEach((v) {
        contractImages!.add( ContractImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CNT_NAME'] = cNTNAME;
    data['CITYNAME'] = cITYNAME;
    data['AREANAME'] = aREANAME;
    data['TENANTNAME'] = tENANTNAME;
    data['MOBILE'] = mOBILE;
    data['CONTRACTNO'] = cONTRACTNO;
    data['DEVNAME'] = dEVNAME;
    data['DEVNAME_AR'] = dEVNAMEAR;
    data['SHORTCODE'] = sHORTCODE;
    data['PROPERTYNAME'] = pROPERTYNAME;
    data['TRANSRENT'] = tRANSRENT;
    data['CONSTARTDT'] = cONSTARTDT;
    data['CONENDDT'] = cONENDDT;
    data['STATUSNAME'] = sTATUSNAME;
    data['CONT_TYPE'] = cONTTYPE;
    data['MUN_CONTNO'] = mUNCONTNO;
    data['INTCONTRACTNO'] = iNTCONTRACTNO;
    data['DEVCODE'] = dEVCODE;
    data['PROPERTYNAME_AR'] = pROPERTYNAMEAR;
    data['COMPLAINREGISTRATION_IMAGE'] = cOMPLAINREGISTRATIONIMAGE;
    if (carParking != null) {
      data['carParking'] = carParking!.map((v) => v.toJson()).toList();
    }
    if (contractImages != null) {
      data['contractImages'] =
          contractImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContractImages {
  String? iMAGEPATH;

  ContractImages({iMAGEPATH});

  ContractImages.fromJson(Map<String, dynamic> json) {
    iMAGEPATH = json['IMAGEPATH'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IMAGEPATH'] = iMAGEPATH;
    return data;
  }
}

class CarParking {
  String? cPNO;

  CarParking({this.cPNO});

  CarParking.fromJson(Map<String, dynamic> json) {
    cPNO = json['CPNO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CPNO'] = cPNO;
    return data;
  }
}