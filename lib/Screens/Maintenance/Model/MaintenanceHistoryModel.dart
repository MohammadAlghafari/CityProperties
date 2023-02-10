class MaintenanceHistoryModel {
  List<ListMaintenanceHistory>? listMaintenanceHistory;

  MaintenanceHistoryModel({this.listMaintenanceHistory});

  MaintenanceHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      listMaintenanceHistory = <ListMaintenanceHistory>[];
      json['name'].forEach((v) {
        listMaintenanceHistory!.add( ListMaintenanceHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (listMaintenanceHistory != null) {
      data['name'] = listMaintenanceHistory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListMaintenanceHistory {
  String? cMDNO;
  String? dEVNAME;
  String? dEVCODE;
  String? sHORTCODE;
  String? sPOTDESC;
  String? sERVICETYPENAME;
  String? cOMPLAINTDESC;
  String? cMDATE;
  String? cMENDDATE;
  String? sTATUSNAME;
  String? aSSIGNEDTO;
  String? kCMDIMAGES;
  String? pROPERTYNAME;
  String? pROPERTYCODE;
  String? pIDNO;
  String? cMNO;
  String? sERVICETYPEID;
  String? cOMPLAINTID;
  String? cMID;
  String? cMDID;
  String? cMDREMARKS;
  String? sTATUSID;
  String? cMDSPOT;
  String? rEASON;

  ListMaintenanceHistory(
      {this.cMDNO,
        this.dEVNAME,
        this.dEVCODE,
        this.sHORTCODE,
        this.sPOTDESC,
        this.sERVICETYPENAME,
        this.cOMPLAINTDESC,
        this.cMDATE,
        this.cMENDDATE,
        this.sTATUSNAME,
        this.aSSIGNEDTO,
        this.kCMDIMAGES,
        this.pROPERTYNAME,
        this.pROPERTYCODE,
        this.pIDNO,
        this.cMNO,
        this.sERVICETYPEID,
        this.cOMPLAINTID,
        this.cMID,
        this.cMDID,
        this.cMDREMARKS,
        this.sTATUSID,
        this.cMDSPOT,
        this.rEASON});

  ListMaintenanceHistory.fromJson(Map<String, dynamic> json) {
    cMDNO = json['CMDNO'];
    dEVNAME = json['DEVNAME'];
    dEVCODE = json['DEVCODE'];
    sHORTCODE = json['SHORTCODE'];
    sPOTDESC = json['SPOTDESC'];
    sERVICETYPENAME = json['SERVICETYPENAME'];
    cOMPLAINTDESC = json['COMPLAINTDESC'];
    cMDATE = json['CMDATE'];
    cMENDDATE = json['CMENDDATE'];
    sTATUSNAME = json['STATUSNAME'];
    aSSIGNEDTO = json['ASSIGNEDTO'];
    kCMDIMAGES = json['KCMD_IMAGES'];
    pROPERTYNAME = json['PROPERTYNAME'];
    pROPERTYCODE = json['PROPERTYCODE'];
    pIDNO = json['PIDNO'];
    cMNO = json['CMNO'];
    sERVICETYPEID = json['SERVICETYPEID'];
    cOMPLAINTID = json['COMPLAINTID'];
    cMID = json['CMID'];
    cMDID = json['CMDID'];
    cMDREMARKS = json['CMDREMARKS'];
    sTATUSID = json['STATUSID'];
    cMDSPOT = json['CMDSPOT'];
    rEASON = json['REASON'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['CMDNO'] = cMDNO;
    data['DEVNAME'] = dEVNAME;
    data['DEVCODE'] = dEVCODE;
    data['SHORTCODE'] = sHORTCODE;
    data['SPOTDESC'] = sPOTDESC;
    data['SERVICETYPENAME'] = sERVICETYPENAME;
    data['COMPLAINTDESC'] = cOMPLAINTDESC;
    data['CMDATE'] = cMDATE;
    data['CMENDDATE'] = cMENDDATE;
    data['STATUSNAME'] = sTATUSNAME;
    data['ASSIGNEDTO'] = aSSIGNEDTO;
    data['KCMD_IMAGES'] = kCMDIMAGES;
    data['PROPERTYNAME'] = pROPERTYNAME;
    data['PROPERTYCODE'] = pROPERTYCODE;
    data['PIDNO'] = pIDNO;
    data['CMNO'] = cMNO;
    data['SERVICETYPEID'] = sERVICETYPEID;
    data['COMPLAINTID'] = cOMPLAINTID;
    data['CMID'] = cMID;
    data['CMDID'] = cMDID;
    data['CMDREMARKS'] = cMDREMARKS;
    data['STATUSID'] = sTATUSID;
    data['CMDSPOT'] = cMDSPOT;
    data['REASON'] = rEASON;
    return data;
  }
}
