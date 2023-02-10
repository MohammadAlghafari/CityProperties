class JobMaterialDataModel {
  List<ListJobMaterialData>? listJobMaterial;

  JobMaterialDataModel({this.listJobMaterial});

  JobMaterialDataModel.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      listJobMaterial = <ListJobMaterialData>[];
      json['name'].forEach((v) {
        listJobMaterial!.add(new ListJobMaterialData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (listJobMaterial != null) {
      data['name'] = listJobMaterial!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListJobMaterialData {
  String? cODE;
  String? dESCRIPTION;
  String? iTEMPICPATH;
  String? uSEDQTY;
  String? rATE;

  ListJobMaterialData(
      {this.cODE, this.dESCRIPTION, this.iTEMPICPATH, this.uSEDQTY, this.rATE});

  ListJobMaterialData.fromJson(Map<String, dynamic> json) {
    cODE = json['CODE'];
    dESCRIPTION = json['DESCRIPTION'];
    iTEMPICPATH = json['ITEMPICPATH'];
    uSEDQTY = json['USEDQTY'];
    rATE = json['RATE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CODE'] = cODE;
    data['DESCRIPTION'] = dESCRIPTION;
    data['ITEMPICPATH'] = iTEMPICPATH;
    data['USEDQTY'] = uSEDQTY;
    data['RATE'] = rATE;
    return data;
  }
}
