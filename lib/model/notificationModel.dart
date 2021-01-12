class NotificationModel {
  bool sucess;
  List<Msg> msg;

  NotificationModel({this.sucess, this.msg});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    sucess = json['sucess'];
    if (json['msg'] != null) {
      msg = new List<Msg>();
      json['msg'].forEach((v) {
        msg.add(new Msg.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sucess'] = this.sucess;
    if (this.msg != null) {
      data['msg'] = this.msg.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Msg {
  String sId;
  int type;
  int time;
  String checkPic;
  bool isViewed;
  String employeeName;
  String checkTime;
  int iV;

  Msg(
      {this.sId,
      this.type,
      this.time,
      this.checkPic,
      this.isViewed,
      this.employeeName,
      this.checkTime,
      this.iV});

  Msg.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    time = json['time'];
    checkPic = json['checkPic'];
    isViewed = json['isViewed'];
    employeeName = json['EmployeeName'];
    checkTime = json['checkTime'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['time'] = this.time;
    data['checkPic'] = this.checkPic;
    data['isViewed'] = this.isViewed;
    data['EmployeeName'] = this.employeeName;
    data['checkTime'] = this.checkTime;
    data['__v'] = this.iV;
    return data;
  }
}
