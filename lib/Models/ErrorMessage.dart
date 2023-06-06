// To parse this JSON data, do
//
//     final errorMessage = errorMessageFromJson(jsonString);

import 'dart:convert';

ErrorMessage errorMessageFromJson(String str) => ErrorMessage.fromJson(json.decode(str));

String errorMessageToJson(ErrorMessage data) => json.encode(data.toJson());

class ErrorMessage {
    String message;
    String response;

    ErrorMessage({
        required this.message,
        required this.response,
    });

    factory ErrorMessage.fromJson(Map<String, dynamic> json) => ErrorMessage(
        message: json["message"],
        response: json["response"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "response": response,
    };
}
