class ProfileModel {
  List<ListProfileModel>? listProfileModel;

  ProfileModel({this.listProfileModel});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      listProfileModel = <ListProfileModel>[];
      json['name'].forEach((v) {
        listProfileModel!.add( ListProfileModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (listProfileModel != null) {
      data['name'] = listProfileModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListProfileModel {
  String? pIDNO;
  String? mOBILE;
  String? tENANTNAME;
  String? eMAIL;
  String? cNTNAME;
  String? pROFNAME;
  String? pHOTO;
  String? gENDER;
  String? oFFPHONE;

  ListProfileModel(
      {this.pIDNO,
        this.mOBILE,
        this.tENANTNAME,
        this.eMAIL,
        this.cNTNAME,
        this.pROFNAME,
        this.pHOTO,
        this.gENDER,
        this.oFFPHONE});

  ListProfileModel.fromJson(Map<String, dynamic> json) {
    pIDNO = json['PIDNO'];
    mOBILE = json['MOBILE'];
    tENANTNAME = json['TENANTNAME'];
    eMAIL = json['EMAIL'];
    cNTNAME = json['CNT_NAME'];
    pROFNAME = json['PROFNAME'];
    pHOTO = json['PHOTO'];
    gENDER = json['GENDER'];
    oFFPHONE = json['OFFPHONE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['PIDNO'] = pIDNO;
    data['MOBILE'] = mOBILE;
    data['TENANTNAME'] = tENANTNAME;
    data['EMAIL'] = eMAIL;
    data['CNT_NAME'] = cNTNAME;
    data['PROFNAME'] = pROFNAME;
    data['PHOTO'] = pHOTO;
    data['GENDER'] = gENDER;
    data['OFFPHONE'] = oFFPHONE;
    return data;
  }
}
