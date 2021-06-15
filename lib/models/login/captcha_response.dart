import 'dart:convert';
import 'dart:typed_data';

class CaptchaResponseModel {
  String? msg;
  Uint8List img = new Uint8List(2000);

  CaptchaResponseModel({this.msg, required this.img});

  CaptchaResponseModel.fromJson(Map<String, dynamic> json) {
    this.msg = json['msg'];
    this.img = Uint8List.fromList(utf8.encode(json['img'].toString()));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['img'] = this.img;
    return data;
  }
}
