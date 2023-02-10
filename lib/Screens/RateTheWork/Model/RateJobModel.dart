

class RateJobModel {
  List<ListRateJob>? listRateJob;

  RateJobModel({this.listRateJob});

  RateJobModel.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      listRateJob = <ListRateJob>[];
      json['response'].forEach((v) {
        listRateJob!.add( ListRateJob.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (listRateJob != null) {
      data['response'] = listRateJob!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListRateJob {
  String? mstResult;

  ListRateJob({this.mstResult});

  ListRateJob.fromJson(Map<String, dynamic> json) {
    mstResult = json['mst_result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['mst_result'] = mstResult;
    return data;
  }
}
