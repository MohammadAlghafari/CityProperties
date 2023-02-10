



class DuePaymentModel {
  List<ListDuePayment>? listDuePayment;

  DuePaymentModel({listDuePayment});

  DuePaymentModel.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      listDuePayment = <ListDuePayment>[];
      json['name'].forEach((v) {
        listDuePayment!.add( ListDuePayment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (listDuePayment != null) {
      data['name'] = listDuePayment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListDuePayment {
  String? tYPENAME;
  String? pAYMENT;
  String? sHORTCODE;
  String? rENTMONTH;
  String? cHEQUENO;
  String? cHEQUEDATE;
  String? dUEDATE;
  String? bANKNAME;
  String? pAYABLEAMT;
  String? bALDAYS;
  String? iNTCONTRACTNO;
  String? tENANTCODE;

  ListDuePayment(
      {tYPENAME,
        pAYMENT,
        sHORTCODE,
        rENTMONTH,
        cHEQUENO,
        cHEQUEDATE,
        dUEDATE,
        bANKNAME,
        pAYABLEAMT,
        bALDAYS,
        iNTCONTRACTNO,
        tENANTCODE});

  ListDuePayment.fromJson(Map<String, dynamic> json) {
    tYPENAME = json['TYPENAME'];
    pAYMENT = json['PAYMENT'];
    sHORTCODE = json['SHORTCODE'];
    rENTMONTH = json['RENTMONTH'];
    cHEQUENO = json['CHEQUE_NO'];
    cHEQUEDATE = json['CHEQUE_DATE'];
    dUEDATE = json['DUEDATE'];
    bANKNAME = json['BANKNAME'];
    pAYABLEAMT = json['PAYABLEAMT'];
    bALDAYS = json['BALDAYS'];
    iNTCONTRACTNO = json['INTCONTRACTNO'];
    tENANTCODE = json['TENANTCODE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['TYPENAME'] = tYPENAME;
    data['PAYMENT'] = pAYMENT;
    data['SHORTCODE'] = sHORTCODE;
    data['RENTMONTH'] = rENTMONTH;
    data['CHEQUE_NO'] = cHEQUENO;
    data['CHEQUE_DATE'] = cHEQUEDATE;
    data['DUEDATE'] = dUEDATE;
    data['BANKNAME'] = bANKNAME;
    data['PAYABLEAMT'] = pAYABLEAMT;
    data['BALDAYS'] = bALDAYS;
    data['INTCONTRACTNO'] = iNTCONTRACTNO;
    data['TENANTCODE'] = tENANTCODE;
    return data;
  }
}
