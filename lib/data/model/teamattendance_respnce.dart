// To parse this JSON data, do
//
//     final welcome6 = welcome6FromJson(jsonString);

import 'dart:convert';

Welcome6 welcome6FromJson(String str) => Welcome6.fromJson(json.decode(str));

String welcome6ToJson(Welcome6 data) => json.encode(data.toJson());

class Welcome6 {
  Welcome6({
    required this.message,
    required this.code,
    required this.data,
  });

  String message;
  int code;
  Data data;

  factory Welcome6.fromJson(Map<String, dynamic> json) => Welcome6(
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
    required this.dataList,
    required this.totalCount,
  });

  List<DataList> dataList;
  int totalCount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    dataList: List<DataList>.from(json["dataList"].map((x) => DataList.fromJson(x))),
    totalCount: json["totalCount"],
  );

  Map<String, dynamic> toJson() => {
    "dataList": List<dynamic>.from(dataList.map((x) => x.toJson())),
    "totalCount": totalCount,
  };
}

class DataList {
  DataList({
    required this.id,
    required this.userName,
    required this.fullName,
    required this.attendance,
    required this.imgUrl,
    required this.actionType,
    required this.checkInDate,
  });

  int id;
  String userName;
  String fullName;
  Attendance attendance;
  ImgUrl imgUrl;
  ActionType actionType;
  CheckInDate checkInDate;

  factory DataList.fromJson(Map<String, dynamic> json) => DataList(
    id: json["id"],
    userName: json["userName"],
    fullName: json["fullName"],
    attendance: attendanceValues.map[json["attendance"]],
    imgUrl: imgUrlValues.map[json["imgUrl"]],
    actionType: ActionType.fromJson(json["actionType"]),
    checkInDate: checkInDateValues.map[json["checkInDate"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "fullName": fullName,
    "attendance": attendanceValues.reverse[attendance],
    "imgUrl": imgUrlValues.reverse[imgUrl],
    "actionType": actionType.toJson(),
    "checkInDate": checkInDateValues.reverse[checkInDate],
  };
}

class ActionType {
  ActionType({
    this.id,
    this.value,
    this.color,
  });

  dynamic id;
  dynamic value;
  dynamic color;

  factory ActionType.fromJson(Map<String, dynamic> json) => ActionType(
    id: json["id"],
    value: json["value"],
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "value": value,
    "color": color,
  };
}

enum Attendance { ABSENT }

final attendanceValues = EnumValues({
  "Absent": Attendance.ABSENT
});

enum CheckInDate { NO_CHECK_IN }

final checkInDateValues = EnumValues({
  "No checkIn": CheckInDate.NO_CHECK_IN
});

enum ImgUrl { IMAGES_AVATAR_AVATAR_PNG }

final imgUrlValues = EnumValues({
  "images/avatar/avatar.png": ImgUrl.IMAGES_AVATAR_AVATAR_PNG
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
