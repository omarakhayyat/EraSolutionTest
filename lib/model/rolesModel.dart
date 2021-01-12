class RolesModel {
  bool sucess;
  List<Msg> msg;

  RolesModel({this.sucess, this.msg});

  RolesModel.fromJson(Map<String, dynamic> json) {
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
  int groupId;
  String groupName;
  String department;
  String scheduleId;
  int iV;

  Msg(
      {this.sId,
      this.groupId,
      this.groupName,
      this.department,
      this.scheduleId,
      this.iV});

  Msg.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    groupId = json['groupId'];
    groupName = json['groupName'];
    department = json['department'];
    scheduleId = json['schedule_Id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['groupId'] = this.groupId;
    data['groupName'] = this.groupName;
    data['department'] = this.department;
    data['schedule_Id'] = this.scheduleId;
    data['__v'] = this.iV;
    return data;
  }
}
