// class LoginModel {
//   final String userName;
//   final String token;
//   final String tokenIssued;
//   final String tokenExpires;

//   LoginModel(this.userName, this.token, this.tokenIssued, this.tokenExpires);

//   LoginModel.fromJson(Map<String, dynamic> json)
//       : userName = json['userName'],
//         token = json['access_token'],
//         tokenIssued = json['.issued'],
//         tokenExpires = json['.expires'];

//   Map<String, dynamic> toJson() => {
//         'userName': userName,
//         'access_token': token,
//         '.issued': tokenIssued,
//         '.expires': tokenExpires,
//       };
// }

class LoginModel {
  bool sucess;
  String token;
  User user;

  LoginModel({this.sucess, this.token, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    sucess = json['sucess'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sucess'] = this.sucess;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  String id;
  String username;

  User({this.id, this.username});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    return data;
  }
}
