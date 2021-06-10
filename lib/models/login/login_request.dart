class LoginRequestModel {

  String? name="";
  String? password="";
  String? code="";

  LoginRequestModel({ this.name, this.password,this.code });

  LoginRequestModel.fromJson(Map<String, dynamic> json){
      this.password = json['password'];
      this.name = json['name'];
      this.code = json['code'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}