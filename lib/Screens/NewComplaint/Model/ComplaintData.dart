

class ComplaintData {
  List<ListComplaint>? listComplaint;

  ComplaintData({this.listComplaint});

  ComplaintData.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      listComplaint = <ListComplaint>[];
      json['name'].forEach((v) {
        listComplaint!.add( ListComplaint.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (listComplaint != null) {
      data['name'] = listComplaint!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListComplaint {
  String? cOMPLAINTID;
  String? pROPERTYCODE;
  String? lOCCODE;
  String? cOMPLAINTSERVICETYPE;
  String? cOMPLAINTDESC;

  ListComplaint(
      {this.cOMPLAINTID,
        this.pROPERTYCODE,
        this.lOCCODE,
        this.cOMPLAINTSERVICETYPE,
        this.cOMPLAINTDESC});

  ListComplaint.fromJson(Map<String, dynamic> json) {
    cOMPLAINTID = json['COMPLAINTID'];
    pROPERTYCODE = json['PROPERTYCODE'];
    lOCCODE = json['LOCCODE'];
    cOMPLAINTSERVICETYPE = json['COMPLAINTSERVICETYPE'];
    cOMPLAINTDESC = json['COMPLAINTDESC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['COMPLAINTID'] = cOMPLAINTID;
    data['PROPERTYCODE'] = pROPERTYCODE;
    data['LOCCODE'] = lOCCODE;
    data['COMPLAINTSERVICETYPE'] = cOMPLAINTSERVICETYPE;
    data['COMPLAINTDESC'] = cOMPLAINTDESC;
    return data;
  }
}
