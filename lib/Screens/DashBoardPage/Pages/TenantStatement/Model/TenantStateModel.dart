class TenantStateModel {
  List<ListTenant>? listTenant;

  TenantStateModel({listTenant});

  TenantStateModel.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      listTenant = <ListTenant>[];
      json['name'].forEach((v) {
        listTenant!.add( ListTenant.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (listTenant != null) {
      data['name'] = listTenant!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListTenant {
  String? dEVNAME;
  String? dEVNAMEAR;
  String? sHORTCODE;
  String? cONTRACTNO;
  String? sTDATE;
  String? eXPDATE;
  String? tRANSRENT;
  String? iNTCONTRACTNO;
  String? tENANTCODE;
  String? cOLLECTEDAMOUNT;
  String? cLEAREDAMOUNT;
  String? uTILIZEDRENT;
  String? oUTSTANDING;

  ListTenant(
      {dEVNAME,
        dEVNAMEAR,
        sHORTCODE,
        cONTRACTNO,
        sTDATE,
        eXPDATE,
        tRANSRENT,
        iNTCONTRACTNO,
        tENANTCODE,
        cOLLECTEDAMOUNT,
        cLEAREDAMOUNT,
        uTILIZEDRENT,
        oUTSTANDING});

  ListTenant.fromJson(Map<String, dynamic> json) {
    dEVNAME = json['DEVNAME'];
    dEVNAMEAR = json['DEVNAME_AR'];
    sHORTCODE = json['SHORTCODE'];
    cONTRACTNO = json['CONTRACTNO'];
    sTDATE = json['ST_DATE'];
    eXPDATE = json['EXP_DATE'];
    tRANSRENT = json['TRANSRENT'];
    iNTCONTRACTNO = json['INTCONTRACTNO'];
    tENANTCODE = json['TENANTCODE'];
    cOLLECTEDAMOUNT = json['COLLECTEDAMOUNT'];
    cLEAREDAMOUNT = json['CLEAREDAMOUNT'];
    uTILIZEDRENT = json['UTILIZED_RENT'];
    oUTSTANDING = json['OUTSTANDING'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['DEVNAME'] = dEVNAME;
    data['DEVNAME_AR'] = dEVNAMEAR;
    data['SHORTCODE'] = sHORTCODE;
    data['CONTRACTNO'] = cONTRACTNO;
    data['ST_DATE'] = sTDATE;
    data['EXP_DATE'] = eXPDATE;
    data['TRANSRENT'] = tRANSRENT;
    data['INTCONTRACTNO'] = iNTCONTRACTNO;
    data['TENANTCODE'] = tENANTCODE;
    data['COLLECTEDAMOUNT'] = cOLLECTEDAMOUNT;
    data['CLEAREDAMOUNT'] = cLEAREDAMOUNT;
    data['UTILIZED_RENT'] = uTILIZEDRENT;
    data['OUTSTANDING'] = oUTSTANDING;
    return data;
  }
}
