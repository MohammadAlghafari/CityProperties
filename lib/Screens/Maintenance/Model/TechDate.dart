


class TechData {
  List<Technician>? technician;

  TechData({this.technician});

  TechData.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      technician = <Technician>[];
      json['name'].forEach((v) {
        technician!.add( Technician.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (technician != null) {
      data['name'] = technician!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Technician {
  String? eMPCODE;
  String? eMPNAME;
  String? eMPNATIONALITY;
  String? eMPPHONE;
  String? eMPPICT;
  String? cOMPNAME;

  Technician(
      {this.eMPCODE,
        this.eMPNAME,
        this.eMPNATIONALITY,
        this.eMPPHONE,
        this.eMPPICT,
        this.cOMPNAME});

  Technician.fromJson(Map<String, dynamic> json) {
    eMPCODE = json['EMP_CODE'];
    eMPNAME = json['EMP_NAME'];
    eMPNATIONALITY = json['EMP_NATIONALITY'];
    eMPPHONE = json['EMP_PHONE'];
    eMPPICT = json['EMP_PICT'];
    cOMPNAME = json['COMP_NAME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['EMP_CODE'] = eMPCODE;
    data['EMP_NAME'] = eMPNAME;
    data['EMP_NATIONALITY'] = eMPNATIONALITY;
    data['EMP_PHONE'] = eMPPHONE;
    data['EMP_PICT'] = eMPPICT;
    data['COMP_NAME'] = cOMPNAME;
    return data;
  }
}
