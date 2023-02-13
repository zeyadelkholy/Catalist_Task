// To parse this JSON data, do
//
//     final welcome10 = welcome10FromJson(jsonString);

import 'dart:convert';

Welcome10 welcome10FromJson(String str) => Welcome10.fromJson(json.decode(str));

String welcome10ToJson(Welcome10 data) => json.encode(data.toJson());

class Welcome10 {
  Welcome10({
    required this.message,
    required this.code,
    required this.data,
  });

  String message;
  int code;
  Data data;

  factory Welcome10.fromJson(Map<String, dynamic> json) => Welcome10(
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
    required this.teamDashboardModules,
  });

  List<TeamDashboardModule> teamDashboardModules;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    teamDashboardModules: List<TeamDashboardModule>.from(json["teamDashboardModules"].map((x) => TeamDashboardModule.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "teamDashboardModules": List<dynamic>.from(teamDashboardModules.map((x) => x.toJson())),
  };
}

class TeamDashboardModule {
  TeamDashboardModule({
    required this.id,
    required this.slaname,
    required this.imagePath,
  });

  int id;
  String slaname;
  String imagePath;

  factory TeamDashboardModule.fromJson(Map<String, dynamic> json) => TeamDashboardModule(
    id: json["id"],
    slaname: json["slaname"],
    imagePath: json["imagePath"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slaname": slaname,
    "imagePath": imagePath,
  };
}
