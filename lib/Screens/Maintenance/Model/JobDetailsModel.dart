


class JobDetailsModel {
  List<ListJobDetails>? listJobDetails;

  JobDetailsModel({this.listJobDetails});

  JobDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      listJobDetails = <ListJobDetails>[];
      json['name'].forEach((v) {
        listJobDetails!.add( ListJobDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (listJobDetails != null) {
      data['name'] = listJobDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListJobDetails {
  String? cMDNO;
  String? cVID;
  String? sHORTCODE;
  String? sPOTDESC;
  String? sERVIVICETYPENAME;
  String? cOMPLAINTDESC;
  String? cMDATE;
  String? cMENDDATE;
  String? sTATUSNAME;
  String? aSSIGNEDTO;
  String? kCMDIMAGES;

  ListJobDetails(
      {this.cMDNO,
        this.cVID,
        this.sHORTCODE,
        this.sPOTDESC,
        this.sERVIVICETYPENAME,
        this.cOMPLAINTDESC,
        this.cMDATE,
        this.cMENDDATE,
        this.sTATUSNAME,
        this.aSSIGNEDTO,
        this.kCMDIMAGES});

  ListJobDetails.fromJson(Map<String, dynamic> json) {
    cMDNO = json['CMDNO'];
    cVID = json['CVID'];
    sHORTCODE = json['SHORTCODE'];
    sPOTDESC = json['SPOTDESC'];
    sERVIVICETYPENAME = json['SERVIVICETYPENAME'];
    cOMPLAINTDESC = json['COMPLAINTDESC'];
    cMDATE = json['CMDATE'];
    cMENDDATE = json['CMENDDATE'];
    sTATUSNAME = json['STATUSNAME'];
    aSSIGNEDTO = json['ASSIGNEDTO'];
    kCMDIMAGES = json['KCMD_IMAGES'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['CMDNO'] = cMDNO;
    data['CVID'] = cVID;
    data['SHORTCODE'] = sHORTCODE;
    data['SPOTDESC'] = sPOTDESC;
    data['SERVIVICETYPENAME'] = sERVIVICETYPENAME;
    data['COMPLAINTDESC'] = cOMPLAINTDESC;
    data['CMDATE'] = cMDATE;
    data['CMENDDATE'] = cMENDDATE;
    data['STATUSNAME'] = sTATUSNAME;
    data['ASSIGNEDTO'] = aSSIGNEDTO;
    data['KCMD_IMAGES'] = kCMDIMAGES;
    return data;
  }
}
