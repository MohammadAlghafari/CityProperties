


class ChequeReturnModel {
  List<ListChequeReturn>? listChequeReturn;

  ChequeReturnModel({listChequeReturn});

  ChequeReturnModel.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      listChequeReturn = <ListChequeReturn>[];
      json['name'].forEach((v) {
        listChequeReturn!.add( ListChequeReturn.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (listChequeReturn != null) {
      data['name'] = listChequeReturn!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListChequeReturn {
  String? sHORTCODE;
  String? tRANSRENT;
  String? rETCHQAMT;
  String? dUEDATE;
  String? cHQURETDATE;
  String? cHQRETREASON;
  String? cHEQUENO;
  String? pAIDAMOUNT;
  String? bALANCE;
  String? iNTCONTRACTNO;
  String? tENANTCODE;
  String? cONTRACTNO;

  ListChequeReturn(
      {sHORTCODE,
        tRANSRENT,
        rETCHQAMT,
        dUEDATE,
        cHQURETDATE,
        cHQRETREASON,
        cHEQUENO,
        pAIDAMOUNT,
        bALANCE,
        iNTCONTRACTNO,
        tENANTCODE,
        cONTRACTNO});

  ListChequeReturn.fromJson(Map<String, dynamic> json) {
    sHORTCODE = json['SHORTCODE'];
    tRANSRENT = json['TRANSRENT'];
    rETCHQAMT = json['RETCHQAMT'];
    dUEDATE = json['DUEDATE'];
    cHQURETDATE = json['CHQURETDATE'];
    cHQRETREASON = json['CHQRETREASON'];
    cHEQUENO = json['CHEQUE_NO'];
    pAIDAMOUNT = json['PAIDAMOUNT'];
    bALANCE = json['BALANCE'];
    iNTCONTRACTNO = json['INTCONTRACTNO'];
    tENANTCODE = json['TENANTCODE'];
    cONTRACTNO = json['CONTRACTNO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['SHORTCODE'] = sHORTCODE;
    data['TRANSRENT'] = tRANSRENT;
    data['RETCHQAMT'] = rETCHQAMT;
    data['DUEDATE'] = dUEDATE;
    data['CHQURETDATE'] = cHQURETDATE;
    data['CHQRETREASON'] = cHQRETREASON;
    data['CHEQUE_NO'] = cHEQUENO;
    data['PAIDAMOUNT'] = pAIDAMOUNT;
    data['BALANCE'] = bALANCE;
    data['INTCONTRACTNO'] = iNTCONTRACTNO;
    data['TENANTCODE'] = tENANTCODE;
    data['CONTRACTNO'] = cONTRACTNO;
    return data;
  }
}
