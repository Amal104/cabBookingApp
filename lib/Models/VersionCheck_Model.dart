import 'dart:convert';

VersionCheckModel versionCheckModelFromJson(String str) =>
    VersionCheckModel.fromJson(json.decode(str));

String versionCheckModelToJson(VersionCheckModel data) =>
    json.encode(data.toJson());

class VersionCheckModel {
  String apikey;
  int version;
  int supportingVersion;
  int userVersionIos;
  int supportingVersionIos;

  VersionCheckModel({
    required this.apikey,
    required this.version,
    required this.supportingVersion,
    required this.userVersionIos,
    required this.supportingVersionIos,
  });

  factory VersionCheckModel.fromJson(Map<String, dynamic> json) =>
      VersionCheckModel(
        apikey: json["APIKEY"],
        version: json["version"],
        supportingVersion: json["supportingVersion"],
        userVersionIos: json["UserVersionIOS"],
        supportingVersionIos: json["supportingVersionIOS"],
      );

  Map<String, dynamic> toJson() => {
        "APIKEY": apikey,
        "version": version,
        "supportingVersion": supportingVersion,
        "UserVersionIOS": userVersionIos,
        "supportingVersionIOS": supportingVersionIos,
      };
}
