class LoginResponseModel {

  String? token="";

  LoginResponseModel({ this.token });

  LoginResponseModel.fromJson(Map<String, dynamic> json){
      this.token = json['token'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}