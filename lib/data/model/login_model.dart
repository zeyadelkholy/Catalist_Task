// To parse this JSON data, do
//
//     final welcome7 = welcome7FromJson(jsonString);

import 'dart:convert';

Welcome7 welcome7FromJson(String str) => Welcome7.fromJson(json.decode(str));

String welcome7ToJson(Welcome7 data) => json.encode(data.toJson());

class Welcome7 {
  Welcome7({
    required this.message,
    required this.code,
    required this.data,
  });

  String message;
  int code;
  Data data;

  factory Welcome7.fromJson(Map<String, dynamic> json) => Welcome7(
    message: json["message"],
    code: json["code"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "code": code,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.userData,
  });

  UserData userData;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userData: UserData.fromJson(json["userData"]),
  );

  Map<String, dynamic> toJson() => {
    "userData": userData.toJson(),
  };
}

class UserData {
  UserData({
    required this.tokens,
    required this.userinfo,
  });

  Tokens tokens;
  Userinfo userinfo;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    tokens: Tokens.fromJson(json["tokens"]),
    userinfo: Userinfo.fromJson(json["userinfo"]),
  );

  Map<String, dynamic> toJson() => {
    "tokens": tokens.toJson(),
    "userinfo": userinfo.toJson(),
  };
}

class Tokens {
  Tokens({
    required this.accessToken,
    required this.refreshToken,
  });

  String accessToken;
  String refreshToken;

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };
}

class Userinfo {
  Userinfo({
    required this.userId,
    required this.userEmail,
    required this.fullName,
    required this.userTelephone,
    required this.photoPath,
    required this.agency,
    required this.role,
    required this.checkedIn,
  });

  int userId;
  String userEmail;
  String fullName;
  String userTelephone;
  String photoPath;
  String agency;
  String role;
  bool checkedIn;

  factory Userinfo.fromJson(Map<String, dynamic> json) => Userinfo(
    userId: json["userId"],
    userEmail: json["userEmail"],
    fullName: json["fullName"],
    userTelephone: json["userTelephone"],
    photoPath: json["photoPath"],
    agency: json["agency"],
    role: json["role"],
    checkedIn: json["checkedIn"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "userEmail": userEmail,
    "fullName": fullName,
    "userTelephone": userTelephone,
    "photoPath": photoPath,
    "agency": agency,
    "role": role,
    "checkedIn": checkedIn,
  };
}
