class EmployeesModel {
  bool sucess;
  List<Msg> msg;

  EmployeesModel({this.sucess, this.msg});

  EmployeesModel.fromJson(Map<String, dynamic> json) {
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
  int age;
  String name;
  String prescription;
  int sex;
  int type;
  String personId;
  String welCome;
  String icCard;
  String card;
  String wn;
  String imgBase;
  int groupId;
  int vipID;
  int iV;

  Msg(
      {this.sId,
      this.age,
      this.name,
      this.prescription,
      this.sex,
      this.type,
      this.personId,
      this.welCome,
      this.icCard,
      this.card,
      this.wn,
      this.imgBase,
      this.groupId,
      this.vipID,
      this.iV});

  Msg.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    age = json['age'];
    name = json['name'];
    prescription = json['prescription'];
    sex = json['sex'];
    type = json['type'];
    personId = json['personId'];
    welCome = json['welCome'];
    icCard = json['icCard'];
    card = json['card'];
    wn = json['wn'];
    imgBase = json['imgBase'];
    groupId = json['groupId'];
    vipID = json['vipID'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['age'] = this.age;
    data['name'] = this.name;
    data['prescription'] = this.prescription;
    data['sex'] = this.sex;
    data['type'] = this.type;
    data['personId'] = this.personId;
    data['welCome'] = this.welCome;
    data['icCard'] = this.icCard;
    data['card'] = this.card;
    data['wn'] = this.wn;
    data['imgBase'] = this.imgBase;
    data['groupId'] = this.groupId;
    data['vipID'] = this.vipID;
    data['__v'] = this.iV;
    return data;
  }
}
