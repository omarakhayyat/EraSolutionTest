class RecordsModel {
  bool sucess;
  List<Msg> msg;

  RecordsModel({this.sucess, this.msg});

  RecordsModel.fromJson(Map<String, dynamic> json) {
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
  String mac;
  String userId;
  int checkTime;
  String timeZone;
  String name;
  String cardNo;
  String idCardNo;
  int mask;
  bool passType;
  int totalFaceNumber;
  String totalPeopleNumber;
  String extra;
  int groupId;
  bool isLate;
  String groupName;
  String checkPic;
  double temperature;
  int checkOutTime;
  int iV;
  int totalHours;

  Msg(
      {this.sId,
      this.mac,
      this.userId,
      this.checkTime,
      this.timeZone,
      this.name,
      this.cardNo,
      this.idCardNo,
      this.mask,
      this.passType,
      this.totalFaceNumber,
      this.totalPeopleNumber,
      this.extra,
      this.groupId,
      this.isLate,
      this.groupName,
      this.checkPic,
      this.temperature,
      this.checkOutTime,
      this.iV,
      this.totalHours});

  Msg.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    mac = json['mac'];
    userId = json['userId'];
    checkTime = json['checkTime'];
    timeZone = json['timeZone'];
    name = json['name'];
    cardNo = json['cardNo'];
    idCardNo = json['idCardNo'];
    mask = json['mask'];
    passType = json['passType'];
    totalFaceNumber = json['totalFaceNumber'];
    totalPeopleNumber = json['totalPeopleNumber'];
    extra = json['extra'];
    groupId = json['groupId'];
    isLate = json['isLate'];
    groupName = json['groupName'];
    checkPic = json['checkPic'];
    temperature =
        json['temperature'] == null ? 0.0 : json['temperature'].toDouble();
    checkOutTime = json['checkOutTime'];
    iV = json['__v'];
    totalHours = json['TotalHours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['mac'] = this.mac;
    data['userId'] = this.userId;
    data['checkTime'] = this.checkTime;
    data['timeZone'] = this.timeZone;
    data['name'] = this.name;
    data['cardNo'] = this.cardNo;
    data['idCardNo'] = this.idCardNo;
    data['mask'] = this.mask;
    data['passType'] = this.passType;
    data['totalFaceNumber'] = this.totalFaceNumber;
    data['totalPeopleNumber'] = this.totalPeopleNumber;
    data['extra'] = this.extra;
    data['groupId'] = this.groupId;
    data['isLate'] = this.isLate;
    data['groupName'] = this.groupName;
    data['checkPic'] = this.checkPic;
    data['temperature'] = this.temperature;
    data['checkOutTime'] = this.checkOutTime;
    data['__v'] = this.iV;
    data['TotalHours'] = this.totalHours;
    return data;
  }
}
