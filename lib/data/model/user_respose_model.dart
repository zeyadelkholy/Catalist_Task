// To parse this JSON data, do
//
//     final welcome5 = welcome5FromJson(jsonString);

import 'dart:convert';

Welcome5 welcome5FromJson(String str) => Welcome5.fromJson(json.decode(str));

String welcome5ToJson(Welcome5 data) => json.encode(data.toJson());

class Welcome5 {
  Welcome5({
    required this.message,
    required this.code,
    this.data,
  });

  String message;
  int code;
  dynamic data;

  factory Welcome5.fromJson(Map<String, dynamic> json) => Welcome5(
    message: json["message"],
    code: json["code"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "code": code,
    "data": data,
  };
}
