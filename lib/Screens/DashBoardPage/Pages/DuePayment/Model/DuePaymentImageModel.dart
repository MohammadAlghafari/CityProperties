

class DuePaymentImageModel {
  List<ListDuePaymentImage>? listDuePaymentImage;

  DuePaymentImageModel({listDuePaymentImage});

  DuePaymentImageModel.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      listDuePaymentImage = <ListDuePaymentImage>[];
      json['name'].forEach((v) {
        listDuePaymentImage!.add( ListDuePaymentImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (listDuePaymentImage != null) {
      data['name'] = listDuePaymentImage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListDuePaymentImage {
  String? cHQNO;
  String? cHQIMAGE;

  ListDuePaymentImage({cHQNO, cHQIMAGE});

  ListDuePaymentImage.fromJson(Map<String, dynamic> json) {
    cHQNO = json['CHQNO'];
    cHQIMAGE = json['CHQIMAGE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['CHQNO'] = cHQNO;
    data['CHQIMAGE'] = cHQIMAGE;
    return data;
  }
}
