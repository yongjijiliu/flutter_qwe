class LoginRequestModel {
  String? username = "";
  String? password = "";
  String? code = "";
  bool? remeberMe = false;

  LoginRequestModel({this.username, this.password, this.code});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    this.password = json['password'];
    this.username = json['username'];
    this.code = json['code'];
    this.remeberMe = json['remeberMe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['code'] = this.code;
    data['remeberMe'] = this.remeberMe;
    return data;
  }
}
