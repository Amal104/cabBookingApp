// To parse this JSON data, do
//
//     final successMessage = successMessageFromJson(jsonString);

import 'dart:convert';

SuccessMessage successMessageFromJson(String str) => SuccessMessage.fromJson(json.decode(str));

String successMessageToJson(SuccessMessage data) => json.encode(data.toJson());

class SuccessMessage {
    bool isExist;
    String user;

    SuccessMessage({
        required this.isExist,
        required this.user,
    });

    factory SuccessMessage.fromJson(Map<String, dynamic> json) => SuccessMessage(
        isExist: json["isExist"],
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "isExist": isExist,
        "user": user,
    };
}
