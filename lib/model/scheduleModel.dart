class ScheduleModel {
  bool sucess;
  List<Msg> msg;

  ScheduleModel({this.sucess, this.msg});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
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
  String name;
  int startTime;
  int startMinutes;
  int endTime;
  int endMinutes;
  int iV;

  Msg(
      {this.sId,
      this.name,
      this.startTime,
      this.startMinutes,
      this.endTime,
      this.endMinutes,
      this.iV});

  Msg.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    startTime = json['startTime'];
    startMinutes = json['startMinutes'];
    endTime = json['endTime'];
    endMinutes = json['endMinutes'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['startTime'] = this.startTime;
    data['startMinutes'] = this.startMinutes;
    data['endTime'] = this.endTime;
    data['endMinutes'] = this.endMinutes;
    data['__v'] = this.iV;
    return data;
  }
}
