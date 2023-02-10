class AnnouncementModel {
  List<ListAnnouncement>? listAnnouncement;

  AnnouncementModel({listAnnouncement});

  AnnouncementModel.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      listAnnouncement = <ListAnnouncement>[];
      json['name'].forEach((v) {
        listAnnouncement!.add( ListAnnouncement.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (listAnnouncement != null) {
      data['name'] = listAnnouncement!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListAnnouncement {
  String? iD;
  String? tITLE;
  String? nEWSDATE;
  String? nEWSDETAIL;
  String? eXPIREON;
  String? sTATUS;
  String? oRDERBY;

  ListAnnouncement(
      {iD,
        tITLE,
        nEWSDATE,
        nEWSDETAIL,
        eXPIREON,
        sTATUS,
        oRDERBY});

  ListAnnouncement.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    tITLE = json['TITLE'];
    nEWSDATE = json['NEWSDATE'];
    nEWSDETAIL = json['NEWSDETAIL'];
    eXPIREON = json['EXPIREON'];
    sTATUS = json['STATUS'];
    oRDERBY = json['ORDERBY'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['ID'] = iD;
    data['TITLE'] = tITLE;
    data['NEWSDATE'] = nEWSDATE;
    data['NEWSDETAIL'] = nEWSDETAIL;
    data['EXPIREON'] = eXPIREON;
    data['STATUS'] = sTATUS;
    data['ORDERBY'] = oRDERBY;
    return data;
  }
}
