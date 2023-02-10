class NotificationModel {
  String? result;
  List<Notifications>? notifications;

  NotificationModel({result, notifications});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['notifications'] != null) {
      notifications = <Notifications>[];
      json['notifications'].forEach((v) {
        notifications!.add( Notifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['result'] = result;
    if (notifications != null) {
      data['notifications'] =
          notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notifications {
  String? subject;
  String? message;
  String? creationDate;
  int? code;

  Notifications({subject, message, creationDate, code});

  Notifications.fromJson(Map<String, dynamic> json) {
    subject = json['subject'];
    message = json['message'];
    creationDate = json['creation_date'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['subject'] = subject;
    data['message'] = message;
    data['creation_date'] = creationDate;
    data['code'] = code;
    return data;
  }
}
