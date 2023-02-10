
class MyRateModel {
  List<ListMyRate>? listMyRate;

  MyRateModel({this.listMyRate});

  MyRateModel.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      listMyRate = <ListMyRate>[];
      json['response'].forEach((v) {
        listMyRate!.add( ListMyRate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (listMyRate != null) {
      data['response'] = listMyRate!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListMyRate {
  String? pRICE;
  String? mATERIAL;
  String? tIME;
  String? qUALITY;
  String? tECHNICIAN;
  String? cOMMENTS;

  ListMyRate(
      {this.pRICE,
        this.mATERIAL,
        this.tIME,
        this.qUALITY,
        this.tECHNICIAN,
        this.cOMMENTS});

  ListMyRate.fromJson(Map<String, dynamic> json) {
    pRICE = json['PRICE'];
    mATERIAL = json['MATERIAL'];
    tIME = json['TIME'];
    qUALITY = json['QUALITY'];
    tECHNICIAN = json['TECHNICIAN'];
    cOMMENTS = json['COMMENTS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['PRICE'] = pRICE;
    data['MATERIAL'] = mATERIAL;
    data['TIME'] = tIME;
    data['QUALITY'] = qUALITY;
    data['TECHNICIAN'] = tECHNICIAN;
    data['COMMENTS'] = cOMMENTS;
    return data;
  }
}


