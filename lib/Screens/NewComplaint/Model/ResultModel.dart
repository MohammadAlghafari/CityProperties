



class ResultData {
  String? status;
   String? contact_no;

  ResultData({this.status, this.contact_no});

  ResultData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    contact_no = json['contact_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['contact_no'] = contact_no;
    return data;
  }
}
