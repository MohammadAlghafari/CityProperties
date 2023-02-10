

class MonthlyPaymentModel {
  List<ListMonthlyPayment>? listMonthlyPayment;

  MonthlyPaymentModel({listMonthlyPayment});

  MonthlyPaymentModel.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      listMonthlyPayment = <ListMonthlyPayment>[];
      json['name'].forEach((v) {
        listMonthlyPayment!.add( ListMonthlyPayment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (listMonthlyPayment != null) {
      data['name'] = listMonthlyPayment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListMonthlyPayment {
  String? dEVNAME;
  String? sHORTCODE;
  String? pIDNO;
  String? tENANTNAME;
  String? pAYNAME;
  String? pAYABLEAMT;
  String? dUEDATE;
  String? iNTCONTRACTNO;
  String? tENANTCODE;
  String? tYPENAME;

  ListMonthlyPayment(
      {dEVNAME,
        sHORTCODE,
        pIDNO,
        tENANTNAME,
        pAYNAME,
        pAYABLEAMT,
        dUEDATE,
        iNTCONTRACTNO,
        tENANTCODE,
        tYPENAME});

  ListMonthlyPayment.fromJson(Map<String, dynamic> json) {
    dEVNAME = json['DEVNAME'];
    sHORTCODE = json['SHORTCODE'];
    pIDNO = json['PIDNO'];
    tENANTNAME = json['TENANTNAME'];
    pAYNAME = json['PAYNAME'];
    pAYABLEAMT = json['PAYABLEAMT'];
    dUEDATE = json['DUEDATE'];
    iNTCONTRACTNO = json['INTCONTRACTNO'];
    tENANTCODE = json['TENANTCODE'];
    tYPENAME = json['TYPENAME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['DEVNAME'] = dEVNAME;
    data['SHORTCODE'] = sHORTCODE;
    data['PIDNO'] = pIDNO;
    data['TENANTNAME'] = tENANTNAME;
    data['PAYNAME'] = pAYNAME;
    data['PAYABLEAMT'] = pAYABLEAMT;
    data['DUEDATE'] = dUEDATE;
    data['INTCONTRACTNO'] = iNTCONTRACTNO;
    data['TENANTCODE'] = tENANTCODE;
    data['TYPENAME'] = tYPENAME;
    return data;
  }
}
