import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    String name;
    String email;
    String mobile;
    Corporate corporate;
    bool isSignatureRequired;
    String signature;
    List<Branch> branch;
    List<Branch> department;

    ProfileModel({
        required this.name,
        required this.email,
        required this.mobile,
        required this.corporate,
        required this.isSignatureRequired,
        required this.signature,
        required this.branch,
        required this.department,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        corporate: Corporate.fromJson(json["corporate"]),
        isSignatureRequired: json["isSignatureRequired"],
        signature: json["signature"],
        branch: List<Branch>.from(json["branch"].map((x) => Branch.fromJson(x))),
        department: List<Branch>.from(json["department"].map((x) => Branch.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "mobile": mobile,
        "corporate": corporate.toJson(),
        "isSignatureRequired": isSignatureRequired,
        "signature": signature,
        "branch": List<dynamic>.from(branch.map((x) => x.toJson())),
        "department": List<dynamic>.from(department.map((x) => x.toJson())),
    };
}

class Branch {
    int id;
    String name;

    Branch({
        required this.id,
        required this.name,
    });

    factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Corporate {
    int corporateId;
    String corporateName;
    String image;
    String empcode;
    String name;
    String reportingManager;
    String reportingManagerMobile;
    String reportingManagerEmail;
    String designation;
    int department;
    int branch;

    Corporate({
        required this.corporateId,
        required this.corporateName,
        required this.image,
        required this.empcode,
        required this.name,
        required this.reportingManager,
        required this.reportingManagerMobile,
        required this.reportingManagerEmail,
        required this.designation,
        required this.department,
        required this.branch,
    });

    factory Corporate.fromJson(Map<String, dynamic> json) => Corporate(
        corporateId: json["corporateId"],
        corporateName: json["corporateName"],
        image: json["image"],
        empcode: json["empcode"],
        name: json["name"],
        reportingManager: json["reportingManager"],
        reportingManagerMobile: json["reportingManagerMobile"],
        reportingManagerEmail: json["reportingManagerEmail"],
        designation: json["designation"],
        department: json["department"],
        branch: json["branch"],
    );

    Map<String, dynamic> toJson() => {
        "corporateId": corporateId,
        "corporateName": corporateName,
        "image": image,
        "empcode": empcode,
        "name": name,
        "reportingManager": reportingManager,
        "reportingManagerMobile": reportingManagerMobile,
        "reportingManagerEmail": reportingManagerEmail,
        "designation": designation,
        "department": department,
        "branch": branch,
    };
}
